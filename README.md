# 🧠 Fullstack Portfolio – [Ricardo Ramos Olivares]

> A professional-grade fullstack project showcasing my ability to architect, build, and scale modern applications using NestJS, PostgreSQL, MongoDB, Docker, React, React Native, and Flutter.

---

## 🚀 Overview

This repository is my fullstack developer portfolio – a technical showcase of my ability to structure clean, modular, and scalable code across both web and mobile platforms.  
The project is currently in progress and evolving daily. The core focus is quality over quantity: **fewer screens, higher polish, deeper architecture**.

### 🎯 Purpose

- Demonstrate strong backend architecture and multi-database integration
- Show ability to build clean, testable frontends in both web and mobile environments
- Highlight skills in authentication, abstraction, Docker-based deployment, and more
- Serve as a base (boilerplate) for future personal and professional projects

---

## 🛠️ Tech Stack

### Backend
- **NestJS** – Modular server-side application framework
- **PostgreSQL** – Structured relational data
- **MongoDB** – Unstructured error/event logging and notifications
- **Docker** – Containerized development environment
- **JWT Auth** + **Role-based access control**
- **Two-factor authentication** 

### Frontend (Web)
- **React** with **Material UI**
- Login + Dashboard views with responsive components

### Mobile
    - **Flutter** – Flutter – Primary mobile app with biometric login, push notifications, and task management features (such as adding tasks, subtasks, marking as completed, etc.).
    Highlights:

    Task management using GetX for state management, including the ability to add, edit, and delete tasks, subtasks, and recurring tasks.

    Uses local_auth for biometric authentication (fingerprint/face recognition).

    Incorporates Firebase for push notifications and real-time task data sync.(Not yet)

    Integrated Task abstraction with polymorphism for managing tasks of different types (Simple, Recurring, Subtask). 
- **React Native** – Alternative implementation (same functionality, different stack)
- **Firebase** – Notifications and real-time database for mobile apps

---

## 📁 Project Structure

```bash
fullstack-portfolio-Ricardo-Ramos/
│
├── backend/             # NestJS + PostgreSQL + MongoDB
├── frontend-react/      # React (web)
├── frontend-flutter/    # Flutter (mobile)
├── frontend-rn/         # React Native (mobile alternative)
├── docker-compose.yaml  # One-command setup
└── README.md
