# 🏢 Coworking Space Management System

![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-Platform-black?style=for-the-badge&logo=jakartaee)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)

A robust, enterprise-grade web application built with **Jakarta EE** for managing modern coworking spaces. This solution streamlines the booking process for users while providing administrators with powerful tools to manage resources, users, and reservations efficiently.

---

## 🌟 Key Features

### 👤 For Members
*   **Seamless Registration & Authentication**: Secure sign-up and login process.
*   **Smart Workspace Search**: detailed filtering by capacity, equipment (Projectors, Whiteboards, etc.), and type (Meeting Room, Shared Desk, Private Office).
*   **Real-time Booking**: Instant reservation system with conflict detection to prevent double-bookings.
*   **My Reservations**: Dashboard to view, manage, and cancel upcoming bookings.
*   **Profile Management**: Update personal details and preferences.

### 🛡️ For Administrators
*   **Admin Dashboard**: Comprehensive overview of system stats and recent activities.
*   **Resource Management (CRUD)**:
    *   **Workspaces**: Add, edit, or remove desks and rooms.
    *   **Equipment**: Manage available amenities and assign them to specific spaces.
    *   **Users**: Manage member accounts and roles.
*   **Reservation Oversight**: View all bookings, filter by date/user, and handle cancellations if necessary.

---

## 🛠️ Technology Stack

| Layer | Technology |
| :--- | :--- |
| **Backend** | Java (Jakarta EE), Servlets, JSP, JSTL |
| **Persistence** | JPA (Java Persistence API), Hibernate |
| **Database** | MySQL |
| **Frontend** | HTML5, CSS3, Bootstrap 5, JavaScript |
| **Build Tool** | Maven / Gradle (Optional) |
| **Server** | Apache Tomcat 9+ / Payara |

---

## 🏛️ Architecture

The application follows the classic **MVC (Model-View-Controller)** design pattern to ensure separation of concerns and maintainability.

*   **Model**: JPA Entities (`User`, `Workspace`, `Reservation`) representing the data.
*   **View**: JSPs (`.jsp`) responsible for the user interface and presentation logic.
*   **Controller**: Java Servlets handling HTTP requests, business logic processing, and navigation.

---

## 🚀 Getting Started

### Prerequisites
*   Java Development Kit (JDK) 8 or higher
*   Apache Tomcat Server (v9.0 or higher)
*   MySQL Server
*   Eclipse IDE for Enterprise Java Developers

### Installation

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/yourusername/CoworkingSpace.git
    ```

2.  **Database Configuration**
    *   Create a MySQL database named `coworking_db`.
    *   Update the `persistence.xml` file located in `src/main/resources/META-INF/` with your database credentials:
        ```xml
        <property name="javax.persistence.jdbc.user" value="your_username" />
        <property name="javax.persistence.jdbc.password" value="your_password" />
        ```

3.  **Run in Eclipse**
    *   Import the project as a **Maven Project** or **Dynamic Web Project**.
    *   Right-click on the project -> `Run As` -> `Run on Server`.
    *   Select your configured Tomcat server and click `Finish`.

4.  **Access the App**
    *   Open your browser and navigate to: `http://localhost:8080/CoworkingSpace`

---

## 🤝 Contributing

Contributions are welcome! Please fork the repository and create a pull request for any feature enhancements or bug fixes.

---

**University Project** - *Created by [Wajih_Lagha]*
