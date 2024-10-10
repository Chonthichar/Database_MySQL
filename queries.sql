-- 3. Write SQL Queries to retrieve the following data from 
-- your PetClinic database. Include the SQLs in your delivery – not only the results.


-- a. List all registered pets, ordered by their birth date-- 

select*
from pet
order by time_of_birth desc;


-- b. Which veterinarian has the highest number of registered appointments? If multiple
-- veterinarians have the same highest number of registered appointments, you may select one
-- of them.

select vet.vet_name ,vet.vet_id, count(vet.vet_id)
from appointment
join vet on vet.vet_id = appointment.vet_id
group by vet.vet_id
having count(vet.vet_id) = (
select max(count)
from (
select vet.vet_id, count(vet.vet_id) as count
from appointment
group by vet_id
) as count);



-- c. Retrieve information about all animal types in the database, and how many times each
-- animal type has been given an appointment in the clinic

select specie.specie_name,count(specie.specie_id) as "times each animal type has been given an appointment in the clinic"
from specie
join pet on pet.specie_id = specie.specie_id
join booking on booking.pet_id = pet.pet_id
join appointment on appointment.booking_id = booking.booking_id
group by specie.specie_id;



-- d. Retrieve a list of appointments where at least one cat is involved. (Use another animal
-- than cat if you do not have cats in your database).

select specie.specie_name,owner.first_name,pet.pet_name,room.room_name, timeslot.start_time, timeslot.end_time,
vet.vet_name, appointment.apt_note, treatment.treatment_name, treatment.price
from appointment
join booking on booking.booking_id = appointment.booking_id
join pet on pet.pet_id = booking.pet_id
join specie on specie.specie_id = pet.specie_id
join owner on owner.owner_id = pet.owner_id
join treatment on treatment.treatment_id = appointment.treatment_id 
join timeslot on timeslot.timeslot_id = appointment.timeslot_id
join vet on vet.vet_id = appointment.vet_id 
join room on room.room_name = appointment.room_name
where specie.specie_name = 'cat';



-- e. Retrieve the total income for the clinic, based on the prices for all treatments in all
-- appointments
 
select sum(treatment.price)
from appointment
join treatment on treatment.treatment_id = appointment.treatment_id;


-- f. Create a view displaying all animal types and how much income each animal type has
-- generated, based on the price of treatments in all appointments. Check to see if your answer
-- corresponds with your result in f

create view displaying_all_animal_type as 
select specie.specie_name,sum(treatment.price) as "Total income of  each animal type"
from appointment
join treatment on treatment.treatment_id = appointment.treatment_id
join booking on appointment.booking_id = booking.booking_id
join pet on pet.pet_id = booking.pet_id
join specie on specie.specie_id = pet.specie_id
group by specie.specie_name;


select *
from displaying_all_animal_type;



-- g. Create two queries where you select information that you find interesting to retrieve from
-- the case. Try to create queries that are a good representation of your level of understanding
-- of SQL. In other words; you decide the level of complexity/difficulty in the queries


-- 1. calculate length of appointment for apt 1
select owner.first_name,pet.pet_name,room.room_name, timeslot.start_time, 
timeslot.end_time, timediff(end_time, start_time) as 'Length', 
vet.vet_name, treatment.treatment_name, treatment.price
from appointment
join timeslot on timeslot.timeslot_id = appointment.timeslot_id
join room on room.room_name = appointment.room_name
join booking on booking.booking_id = appointment.booking_id
join pet on pet.pet_id = booking.pet_id
join owner on owner.owner_id = pet.owner_id
join vet on vet.vet_id = appointment.vet_id
join treatment on treatment.treatment_id = appointment.treatment_id
where apt_id = 5;



-- 2. count the number of unique patients who have been schedule for examonation room c
select count(distinct appointment.booking_id) as  "Number of pet who have been schedule for examonation room c"
from appointment
join booking on booking.booking_id = appointment.booking_id
join pet on pet.pet_id = booking.pet_id
join room on room.room_name = appointment.room_name
join timeslot on timeslot.timeslot_id = appointment.timeslot_id
where room.room_name = 'C';

