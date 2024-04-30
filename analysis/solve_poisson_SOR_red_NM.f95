subroutine solve(data_in, data_out, dx, dy, om, nx, ny)
! =====================================================
! Solve poisson equation with SOR
! =====================================================
    integer, intent(in)                            :: nx, ny
    real, intent(in)                               :: dx, dy, om
    real(kind=8), intent(in), dimension(ny, nx)    :: data_in(ny, nx)
    real(kind=8), intent(inout), dimension(ny, nx) :: data_out(ny, nx)
    integer                                        :: i, j
    real(kind=8)                                   :: tmp

    do i = 1, nx
        do j = 2, ny -1
            if (mod(i + j, 2) == 1) then
                if (i == 1) then
                    tmp = (data_out(j, i+1) + data_out(j, nx) &
                       & + data_out(j+1, i) + data_out(j-1, i)  &
                       & - ((dx * dy) * data_in(j, i)))
                elseif (i == nx) then
                    tmp = (data_out(j, 1) + data_out(j, i-1)  &
                       & + data_out(j+1, i) + data_out(j-1, i)  &
                       & - ((dx * dy) * data_in(j, i)))
                else
                    tmp = (data_out(j, i+1) + data_out(j, i-1)  &
                       & + data_out(j+1, i) + data_out(j-1, i)  &
                       & - ((dx * dy) * data_in(j, i)))
                end if
                data_out(j, i) = (((1 - om) * data_out(j, i)) &
                                & + om * (tmp / 4))
            end if
        end do
    end do

end subroutine solve