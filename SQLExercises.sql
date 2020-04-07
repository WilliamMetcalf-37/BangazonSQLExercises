select e.FirstName, e.LastName, d.name  from Employee e left join Department d on d.Id = e.DepartmentId order by d.name
select e.FirstName, e.LastName, d.name  from Employee e left join Department d on d.Id = e.DepartmentId order by e.LastName
select e.FirstName, e.LastName, d.name  from Employee e left join Department d on d.Id = e.DepartmentId order by e.FirstName


select * from Department order by Budget desc

select d.name, e.FirstName, e.LastName from Department d left join Employee e on d.Id = e.DepartmentId where e.IsSupervisor = 'True'

select d.name, Count(e.id) as employeeCount from Department d left join Employee e on d.Id = e.DepartmentId group by d.Name

select * from Department order by Budget desc
update Department set Budget = Budget*1.2
select * from Department order by Budget desc


select e.FirstName, e.LastName from Employee e left join EmployeeTraining et on e.Id = et.EmployeeId group by e.FirstName, e.LastName having COUNT(et.Id) = 0 
select e.FirstName, e.LastName, COUNT(et.Id) as NumberOfPrograms from Employee e left join EmployeeTraining et on e.Id = et.EmployeeId group by e.FirstName, e.LastName having COUNT(et.Id) > 0 


select tp.[Name], COUNT(e.Id) as NumOfEmps from TrainingProgram tp left join EmployeeTraining et on et.TrainingProgramId = tp.Id   left join Employee e on e.Id = et.EmployeeId group by tp.Name

select tp.[Name], tp.MaxAttendees ,COUNT(e.Id) as NumOfEmps from TrainingProgram tp left join EmployeeTraining et on et.TrainingProgramId = tp.Id   left join Employee e on e.Id = et.EmployeeId group by tp.Name, tp.MaxAttendees

select tp.Name, tp.StartDate from TrainingProgram tp where tp.StartDate > GETDATE() order by tp.StartDate

insert into EmployeeTraining (EmployeeId, TrainingProgramId)values (1,5)
insert into EmployeeTraining (EmployeeId, TrainingProgramId)values (2,5)
insert into EmployeeTraining (EmployeeId, TrainingProgramId)values (3,5)


select top 3  tp.name, COUNT(e.Id) as NumOfEmps from TrainingProgram tp left join EmployeeTraining et on et.TrainingProgramId = tp.Id   left join Employee e on e.Id = et.EmployeeId group by tp.Name, tp.id order by COUNT(e.Id) desc

select top 3 tp.name, COUNT(e.Id) as NumOfEmps from TrainingProgram tp left join EmployeeTraining et on et.TrainingProgramId = tp.Id   left join Employee e on e.Id = et.EmployeeId group by tp.Name order by COUNT(e.Id) desc

select e.FirstName, e.LastName, COALESCE((c.Make + ' ' + c.Manufacturer), 'N/A') as ComputerInfo 
from Employee e left join ComputerEmployee ce on e.Id = ce.EmployeeId 
left join Computer c on ce.ComputerId = c.Id 
group by e.FirstName, e.LastName, ce.AssignDate, ce.UnassignDate, c.Make, c.Manufacturer
having ce.UnassignDate is NULL

select Make, Manufacturer from Computer
where purchaseDate < CONVERT(datetime,'2019-07-01') and DecomissionDate is NULL


select CONCAT(e.FirstName, e.LastName) as Name, COUNT(c.ID) as CompCount
from Employee e left join ComputerEmployee ce on e.Id = ce.EmployeeId 
left join Computer c on ce.ComputerId = c.Id 
group by e.FirstName, e.LastName
order by e.FirstName



select pt.Name, Count(c.Id) as [Count] from PaymentType pt left join Customer c on c.Id = pt.CustomerId group by pt.name


select top 10 p.Title, p.Price, CONCAT(c.FirstName, c.LastName) as Name 
from Product p left join ProductType pt on p.ProductTypeId = pt.Id 
left join Customer c on c.Id = p.CustomerId 
group by p.Title, p.price, c.FirstName, c.LastName order by p.Price desc


select top 10 p.Title, CONCAT(c.FirstName, c.LastName) as Name from Product p
left join OrderProduct op on p.Id = op.ProductId
left join Customer c on c.Id = p.CustomerId 
group by p.Title, p.price, c.FirstName, c.LastName order by Count(op.ProductId) desc


select top 1 CONCAT(c.FirstName, c.LastName) as Name from [Order] o
left join Customer c on c.Id = o.CustomerId
left join OrderProduct op on op.OrderId = o.Id
group by c.FirstName, c.LastName order by COUNT(op.ProductId) desc

select pt.name, Count(p.Id) as NUmOfSales from ProductType pt
left join Product p on p.ProductTypeId = pt.Id
left join OrderProduct op on op.ProductId = p.Id
group by pt.Name


select c.Id, CONCAT(c.FirstName, c.LastName) as Name, COALEScE(SUM(p.Price),0) as CASHMONEYS from Customer c
left join Product p on p.CustomerId = c.Id
left join OrderProduct op on p.Id = op.ProductId
group by c.Id, c.FirstName, c.LastName order by SUM(p.Price) desc

select op.ProductId, op.OrderId from OrderProduct op where op.ProductId = 24