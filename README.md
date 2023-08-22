# Car Sales Database

Postgre SQL implementation of Simple Car Sales Business workflow as Final Project for PACMANN Relational Database Course

# Database Purpose

Relational Database for used car website where seller can post the car and buyer can bid based on their preference

# Business Rules / Feature Limitation:

1. Each user of the application can offer more than one used car product.
2. Before selling a car product, users must complete their personal information, such as name, contact details, and residential location.
3. Users can offer their products through advertisements displayed on the website.
4. These ads include a title, detailed information about the offered product, and seller contact information.
5. Some information that should be included in the ad is as follows:
   - Car brand: Toyota, Daihatsu, Honda, etc.
   - Model: Toyota Camry, Toyota Corolla Altis, Toyota Vios, Toyota Camry Hybrid, etc.
   - Car body type: MPV, SUV, Van, Sedan, Hatchback, etc.
   - Car type: manual or automatic.
   - Year of car manufacture: 2005, 2010, 2011, 2020.
   - Other descriptions, such as color, mileage, etc., can be added as needed.
6. Each user can search for offered cars based on the seller's location, car brand, and car body type.
7. If a potential buyer is interested in a car, they can make an offer (bid) on the product price if the seller allows bidding.
8. Purchase transactions are conducted outside the application and are not within the scope of the project.

# ER Diagram

![ERD](/image/ERD.png)