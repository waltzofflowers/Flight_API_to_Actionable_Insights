# Flight API to Actionable Insights

## Overview
This project focuses on analyzing flight data retrieved from the Aviation Stack API. The goal is to perform exploratory data analysis (EDA), normalize the data into a relational database, and create fact and dimension tables to facilitate efficient querying and reporting.

## Table of Contents
- [Technologies Used](#technologies-used)
- [Data Retrieval](#data-retrieval)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Database Design](#database-design)
- [Tables Created](#tables-created)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Technologies Used
- **Database Management System:** Microsoft SQL Server
- **Programming Language:** SQL, SQLAlchemy ,Python
- **Data Source:** Aviation Stack API
- **Data Analysis Tools:** Pandas

## Data Retrieval
The flight data is retrieved using the Aviation Stack API, which includes various attributes such as flight status, departure and arrival airports, delays, and more.

## Exploratory Data Analysis
- Conducted data cleaning and preprocessing to handle missing values and outliers.
- Performed exploratory data analysis to identify trends and patterns in flight delays, airport traffic, and other key metrics.

## Database Design
The database is designed using a star schema to optimize performance and ease of reporting. The main components include fact tables and dimension tables.

### Tables Created
1. **Delay Table**
   - Stores unique delay records with `delay_id`, `departure_delay`, and `arrival_delay`.

2. **Airport Table**
   - Contains distinct airports with `airport_id`, `departure_airport`, and `arrival_airport`.

3. **Departure Table**
   - Records unique departure locations with `departure_id`, `departure_continent`, and `departure_city`.

4. **Arrival Table**
   - Stores unique arrival locations with `arrival_id`, `arrival_continent`, and `arrival_city`.

5. **Flight Table**
   - Contains flight records with `flight_id`, `flight_date`, and `flight_status`.

6. **Flight_Final Table**
   - The central table combining data from other tables, linking `flight_id`, `airport_id`, `departure_id`, `arrival_id`, and `delay_id` with relevant attributes.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/waltzofflowers/Flight_API_to_Actionable_Insights.git

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your proposed changes. Be sure to include tests for any new features or fixes.
