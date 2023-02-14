select * from tblmember
go
select count(PK_memberID) from tblmember
where UserPasswork = '1234567a'
and PK_memberID= 2
group by UserPasswork

go

alter proc check1
--@memberID varchar(10),
@pass varchar(50)
as
begin
	select count(PK_memberID) from tblmember
	where UserPasswork = @pass
	and PK_memberID= 2
	group by UserPasswork

end
go
exec check1 '1234567a'
go

create proc check2
--@memberID varchar(10),
@pass varchar(50)
as
begin
	select *from tblmember
	where UserPasswork = @pass
	and PK_memberID= 2

end
go
exec check2 '2345678a'

go
create proc updatePass
@pass varchar(50)
as
begin
	update tblmember
	set UserPasswork = @pass
	where PK_memberID = 2
end

