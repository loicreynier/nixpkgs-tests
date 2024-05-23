!> Quickmaths module for performing basic arithmetic.
module quickmaths
  implicit none

contains

  !> Add two integers and returns the result.
  pure function add(a, b) result(sum)
    integer, intent(in) :: a, b
    integer :: sum
    sum = a + b
  end function add

end module quickmaths
