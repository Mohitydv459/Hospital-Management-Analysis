# Hospital-Management-Analysis

# End-to-End Hospital Management Analytics Project

This project is a complete end-to-end data analytics workflow. It uses Python for data cleaning and loading, MySQL for data storage and analysis, and Power BI for interactive visualization. The goal is to analyze a hospital's patient, appointment, and billing data to uncover insights for administrative and operational improvements.

## 📊 Hospital Management Dashboard

This is the final interactive dashboard built in Power BI. It provides a high-level overview of key hospital metrics and allows for detailed, interactive filtering.

![Hospital Management Dashboard](---<img width="1441" height="811" alt="Hospital management dashboard" src="https://github.com/user-attachments/assets/cdac4e82-362d-42e4-9756-4662a95d8899" />)


---

## 🎯 Project Objective

To analyze a hospital's patient and admission data to identify patterns in:
* **Financial Performance:** Revenue by doctor, treatment, and payment status.
* **Operational Efficiency:** Appointment trends, cancellation rates, and no-shows.
* **Patient Demographics:** Patient age, gender, and registration trends.

The final dashboard is intended for hospital administrators to make data-driven decisions to optimize revenue and improve patient services.


## 🛠️ Tools Used

* **Python (Pandas & SQLAlchemy):** For Data Cleaning, Transformation, and loading (ETL).
* **MySQL:** For relational database storage and advanced querying (SQL).
* **Power BI:** For Data Modeling, DAX calculations, and interactive dashboard creation.

---

## 📈 Project Workflow

This project follows a complete end-to-end analytics workflow:

1.  **Extract, Transform, Load (ETL)**
    * The `Healtcare analysis.ipynb` notebook loads the 5 raw CSV files (`patients.csv`, `doctors.csv`, etc.) into Pandas DataFrames.
    * Data is cleaned and transformed (e.g., converting date columns from `object` to `datetime`, checking for inconsistencies).
    * The cleaned DataFrames are then loaded directly into a MySQL database using `SQLAlchemy`, creating a 5-table relational schema.

2.  **Database Analysis (SQL)**
    * The `healthcare data.sql` file contains all the advanced SQL queries used to analyze the data and calculate key performance indicators (KPIs).
    * This includes multi-table `JOIN`s, `GROUP BY` aggregations, and `CASE` statements to calculate metrics like:
        * Total Revenue (filtered for 'Paid' status)
        * Revenue per Doctor & Specialization
        * Appointment Status Breakdown (Completed, Cancelled, No-Show)
        * Cancellation Rate (%)
        * Monthly Appointment Trends
        * Doctor Efficiency (e.g., total appointments vs. total revenue)

3.  **Visualization (Power BI)**
    * Power BI connects directly to the `healthcare` database in MySQL.
    * The 5 tables are loaded into the Power BI data model, and relationships are established between them.
    * The dashboard is built with a variety of visuals, including:
        * **KPI Cards:** For high-level metrics (Total Revenue, Total Patients, etc.).
        * **Bar & Donut Charts:** To break down revenue by doctor, treatment, and payment status.
        * **Line Chart:** To show appointment trends over time.
        * **Slicers:** To make the dashboard fully interactive, allowing users to filter by Doctor Specialization, Date, Payment Status, and Appointment Status.

---

## 🗂️ File Descriptions

* `Raw Data/` Healthcare dataset:
    * `patients.csv`: Patient demographic information.
    * `doctors.csv`: Doctor information and specialization.
    * `appointments.csv`: Appointment records, dates, and statuses.
    * `treatments.csv`: Details on treatments and their base costs.
    * `billing.csv`: Billing records, amounts, and payment statuses.
* `Healtcare analysis.ipynb`: Jupyter Notebook containing the Python code for data cleaning (ETL) and loading into MySQL.
* `healthcare data.sql`: SQL script containing all analysis queries and KPI calculations.
* `Hospital management dashboard.pbix`: The Power BI project file containing the data model, DAX, and dashboard.
* `Hospital management dashboard.png`: The screenshot of the final dashboard used in this README.
