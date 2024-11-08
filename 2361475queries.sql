create table sales (  
   VIN            INT,
   vehicle_name   varchar(50) not null,  
   product_family varchar(50),
   no_units_sold  INT,
   price_unit     INT,
   country        varchar(50), 
   order_date     date,
   sale_date      date,
   additional_costs  INT,
   delivery_date     date,  
   dealer_id         INT,
   type_of_contract  varchar(50),
   production_costs INT,
   emp_id         INT,
  constraint pk_sales_dashboard primary key (VIN));
describe sales;
