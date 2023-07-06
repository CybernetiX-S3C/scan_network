program scan_network

implicit none

integer :: i, port, socket, sockaddr_in
character(len=16) :: host, service, protocol, banner, encryption
logical :: resolve, whois, debug
integer :: timeout = 10
integer :: count = 0

if (present(protocol)) then
  protocol = iarg(1)
end if

if (present(service)) then
  service = iarg(2)
end if

if (present(banner)) then
  banner = iarg(3)
end if

if (present(encryption)) then
  encryption = iarg(4)
end if

if (present(timeout)) then
  timeout = iarg(5)
end if

if (present(resolve)) then
  resolve = iarg(6)
end if

if (present(whois)) then
  whois = iarg(7)
end if

if (present(debug)) then
  debug = iarg(8)
end if

socket = socket(AF_INET, SOCK_STREAM, 0)
if (socket < 0) then
  print *, 'Error creating socket'
  return
end if

sockaddr_in = sockaddr_in(INADDR_ANY, 0)

do i = 1, 65535
  call connect(socket, sockaddr_in, sizeof(sockaddr_in))
  if (ichar(status) /= 0) then
    print *, 'Port ', i, ' is open'
    count = count + 1
    if (banner) then
      call scan_service(socket, service)
    end if
  end if
end do

close(socket)

if (debug) then
  print *, 'Scan completed successfully'
  print *, 'Number of open ports: ', count
end if

if (whois) then
  if (resolve) then
    print *, 'Resolving host names...'
    call resolve_host(host)
  end if
  print *, 'Looking up whois information...'
  call whois(host)
end if

contains

subroutine scan_service(socket, service)

implicit none

integer :: socket
character(len=16) :: service

call send_packet(socket, 'SERVICE-VERSION')
service = recv_packet(socket)

if (service /= '') then
  print *, 'Service ', service, ' is running on port ', i
end if

end subroutine scan_service

subroutine resolve_host(host)

implicit none

character(len=16) :: host

call gethostbyname(host, address)

if (address > 0) then
  print *, 'Host name ', host, ' resolves to ', address
end if

end subroutine resolve_host

subroutine whois(host)

implicit none

character(len=16) :: host

call whois(host)

end subroutine whois

end program scan_network

function get_version() result(version)

implicit none

character(len=32) :: version

version = '1.0'

end function get_version

function get_os_version(socket) result(os_version)

implicit none

integer :: socket
character(len=32) :: os_version

call send_packet(socket, 'OS-VERSION')
os_version = recv_packet(socket)

end function get_os_version

function get_service_version(socket) result(service_version)

implicit none

integer :: socket
character(len=32) :: service_version

call send_packet(socket, 'SERVICE-VERSION')
service_version = recv_packet(socket)

end function get_service_version
