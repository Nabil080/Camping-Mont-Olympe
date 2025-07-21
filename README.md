#  Camping Mont-Olympe - Web Booking & Admin Management Platform

**Camping Mont-Olympe** is a full-stack web application I developed as part of my final project to obtain my *Web Developer / Web Mobile* certificate. The platform includes a responsive public-facing website for visitors, as well as a powerful internal tool for campsite management.

While the project is not fully finalized, it served as the cornerstone of my exam and showcases a wide range of real-world development skills using **Symfony**, **Doctrine**, **Twig**, **TailwindCSS**, and **MySQL**.

---

## Key Features

### Multi-Role System

* **Visitors** can explore the site, view available camping spots, and make online reservations.
* **Employees** access a dashboard to manage daily operations such as check-ins/check-outs and cash register handling.
* **Administrators** have advanced tools to configure pricing rules, define reservation conditions, track statistics, and monitor activity logs.

### Reservation Engine

* Real-time search with rule-based filtering (by date, duration, guest count).
* Fully configurable: allowed arrival/departure days, seasonal rules, guest limits, and more.
* Built-in logic for available options and pricing per accommodation.
* Planned integration of online payment via Stripe.

### Admin Dashboard

* Visual calendar view for bookings.
* Invoicing and live payment tracking.
* Rule-based configuration of prices, discounts, taxes, seasons, and services.
* JSON config file for centralized and portable settings.
* System-wide logging of administrative actions.

### Modern Frontend

* Tailored, responsive design.
* Dynamic content for services, accommodations, and surrounding activities.
* Contact and FAQ features with smart routing and contextual display.
* Optimized for both desktop and mobile users (front-end), and for desktop-only internal use (admin interface).

---

## Tech Stack

| Front-End                | Back-End     | Tools & DevOps       |
| ------------------------ | ------------ | -------------------- |
| TailwindCSS              | Symfony 6    | Git & GitHub         |
| Twig Templates           | Doctrine ORM | Trello (Agile board) |
| Vanilla JS + Stimulus.js | PHP 8        | Webpack Encore       |
| Responsive Layout        | MySQL        | VS Code + CLI        |

---

## Want a Deeper Technical Dive?

As part of my final exam, I wrote a **detailed specification document** outlining the full scope of the project: from context and objectives to user stories, technical choices, data modeling, service structure, and code examples.

This document, submitted along with the code, was essential to obtaining my **Web Developer professional certificate**.

**[Download the full Cahier des Charges (PDF)](./Camping-Mont-Olympe_CDC.pdf)**
*(Document is in French, with an executive summary in English.)*

---

## Second Version

This project laid the groundwork for a **second version**, focusing solely on the **administrative tool** and aims to be **fully reusable across multiple campgrounds**, regardless of their specific setup.
You can check it [here](https://github.com/Nabil080/applicamping)

## Certification Acknowledgment

This project served as my **capstone (chef-d'œuvre)** for the *Titre Professionnel Développeur Web/Web Mobile – Niveau 5*.
It demonstrates my ability to plan, architect, and develop production-grade full-stack applications while considering client needs, scalability, and maintainability.

This version was developed in the context of an exam and an internship.
While it includes core functionality (CRUD, user auth, reservation logic, dynamic frontend/admin), some parts—such as full payment integration and final frontend polish—remain unfinished.
