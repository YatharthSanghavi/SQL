-->Lab 13
-->PART-A

--1.Write a function to print "hello world"
create or alter function hello()
Returns varchar(100)
as
begin
return 'hello world';
end

select dbo.hello()

--2. Write a function which returns addition of two numbers
create or alter function addn( @a int,@b int)
returns int 
as 
begin
return @a+@b
end

select dbo.addn(10,20)

--3. Write a function to check whether the given number is ODD or EVEN.
create or alter function oddeven(@a int)
returns varchar(100)
as
begin
	return case
		when @a%2=0 then 'even'
		when @a%2!=0 then 'odd'
	end
end

select dbo.oddeven(10)

--4. Write a function which returns a table with details of a person whose first name starts with B
create or alter function person_tab()
returns table
as
	return select * from pe where firstname like 'b%'

select * from dbo.person_tab()

--5. Write a function which returns a table with unique first names from the person table.
create or alter function unique_p()
returns table
as 
	return select distinct firstname from pe

select * from dbo.unique_p()

--6. Write a function to print number from 1 to N. (Using while loop)create or alter function printn(@a int)returns @r table (num int)asbegindeclare 	@i int =1	while @i != @a		begin			insert into @r values(@i)			set @i=@i+1		end	returnendselect * from dbo.printn(10)--7. Write a function to find the factorial of a given integer.create or alter function fac(@a int)returns intasbegindeclare  @i int =1,@f int=1	while @i <= @a		begin			set @f=@f*@i			set @i=@i+1		end	return @fendselect dbo.fac(5)-->part-B:--1.Write a function to compare two integers and return the comparison result. (Using Case statement)create or alter function casef(@a int,@b int)returns varchar(100)as begin	return case		when @a>@b then 'not equal'		when @a<@b then 'a is small'	endendselect dbo.casef(10,20)--2 Write a function to print the sum of even numbers between 1 to 20.create or alter function sume()returns intasbegindeclare @i int=1,@sum int=0	while(@i<=20)			begin			if(@i%2=0)				set @sum=@sum+@i			set @i=@i+1		end		return @sumendselect dbo.sume()--3. Write a function that checks if a given string is a palindromecreate or alter function palin(@a varchar(100))returns varchar(100)asbegin	declare @str varchar(100) = reverse(@a)	return case		when @str = @a then 'palindrome'		when @str !=@a then 'not palindrome'	endendselect dbo.palin('ram')--part-c--1. Write a function to check whether a given number is prime or not.create or alter function prime(@a int)returns varchar(100)as begin	declare @i int=1,@f int =2;	while(@i<=@a)		begin			if(@a%@f=0)				begin					set @f=@f+1;				end		set @i=@i+1	end	return case	when @f=2 then 'prime'	when @f!=2 then 'not prime'	endendselect dbo.prime(5)--2. Write a function which accepts two parameters start date & end date, and returns a difference in days.