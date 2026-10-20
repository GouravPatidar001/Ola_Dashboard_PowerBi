Create Database Ola;
Use Ola;

#1. Retrieve all successful bookings:
#Create View Successful_Bookings As

select * from bookings where Booking_Status = 'Success';
select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
select Vehicle_Type, AVG(Ride_distance) 
as avg_distance From Bookings 
Group By Vehicle_Type;

Select * from ride_distance_for_each_vehicle;


#3. Get the total number of cancelled rides by customers:
Create View canceled_rides_by_customers As
Select count(*) From Bookings where Booking_status = 'Canceled by Customers';

Select * From canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Create view highest_number_of_rides As
select Customer_ID, count(Booking_ID) as total_rides
From bookings
Group by Customer_ID
Order by total_rides desc limit 5;

Select * From highest_number_of_rides;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View cancel_by_drivers As
Select count(*) from bookings 
where canceled_rides_by_driver = 'personal & car related issue'; 

Select * From cancel_by_drivers;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
From bookings where Vehicle_type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Select * From bookings where Payment_Method = 'UPI';

# find the average customer rating per vehicle type:
select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
From bookings
Group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as total_successful_value
From bookings
Where Booking_status = 'Success';

#10. List all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';