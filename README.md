# MiniCRM — Rails Coding Exercise

Welcome! This take-home exercise is designed to evaluate your ability to work with Ruby on Rails, model domain logic, write queries, and build a small but clean user experience. You’ll be working in this starter Rails 7 application, which already includes authentication and a modern front-end setup.

---

## 🧱 Tech Stack (Pre-Installed)

- **Ruby** 3.3.10
- **Rails** 7.2.2.2
- **PostgreSQL**
- **Devise** for authentication (`User` model)
- **Pundit** for authorization (`app/policies` directory)
- **Haml** for templating
- **Bootstrap 5** + **Hotwire (Turbo + Stimulus)** for UI
- **ViewComponent** for reusable UI components
- **esbuild + Dart Sass** for JS/CSS bundling
- **No testing framework pre-installed** — you may choose and configure your own (RSpec, Minitest, etc.)

---

## 🚀 Setup Instructions

### 1. Clone this repository

Click the green **"Use this template"** button on Github and select **"Create a new repository"**.

Then clone the new repository to your local environment:

```bash
git clone https://github.com/<your username>/biozyme-mini-crm.git
cd biozyme-mini-crm
```

### 2. Install dependencies

The application was created using Ruby 3.3.9.  If you have a newer version of Ruby already installed and would prefer to just use that, you are welcome to do so.

```bash
bundle install
yarn install
```

### 3. Set up the database

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

This seeds one demo user:

```
Email: asm1@example.com
Password: password
```

### 4. Run the app

```bash
bin/dev
```

Then visit http://localhost:3000

You should see a Bootstrap-styled home page with a navigation bar and sign-in/sign-out links.

---

## 💼 Your Task

Build a **mini-CRM** where an Account/Sales Manager (ASM) can:

1. **Manage Contacts** — full CRUD interface; contacts are assigned to a primary user
2. **Record Sales** — each sale belongs to a contact and a user.
3. **Set Budgets** — a yearly budget per contact per user.
4. **View a Quarterly Commission Report** — for their own performance.

The **report** should:

- Aggregate sales by quarter and show commissions.
- Display a table with:
  `Quarter | Total Sales (Direct) | Total Sales (Indirect) | Commission`.

---

## 💰 Commission Rules

- **Direct commission:** 5% of total sales created by the current user.
- **Indirect commission:** 2% of sales made by other users to contacts where the current user is the `primary_user`.
- Quarters use standard calendar quarters (Q1 = Jan–Mar, etc.).
- You may hard-code or dynamically calculate the fiscal year as appropriate.

---

## 🛠 Requirements

### Core

- CRUD for **Contacts**, **Sales**, and **Budgets**.
- Authorization using **Pundit**.  Users should only be able to view their own reports.
- Commission report page showing all four quarters.  This page should be scoped to a year and have a filter allowing the user to change years.
- Use **ViewComponent** for the report table and anywhere else you think it is appropriate.
- Minimal but clean UI using Bootstrap.
- Working seeds to demonstrate sample data.  Include multiple users, each with contacts and sales (both direct and indirect) for multiple years.

### Optional Enhancements

You are free to add any enhancements you would like.

### Testing (Optional)

No test framework is configured by default, and you are not required to write tests.
But if you want to, you can add either **RSpec** or **Minitest**.

---

## 📦 Deliverables

Please submit either:

- A link to your public **GitHub repository**, or
- A link to your private **GitHub repository** (ensure that the Github user **reed** has access to view)

This README should be appended to include:

- Any setup/run instructions (if there are any).
- A short note on your design choices.
- Any trade-offs or TODOs if you ran out of time.

Provide answers to the questions listed in the QUESTIONS.md file.  You can either commit your answers in that file, or include them in your email providing the repository link.

---

## 🧮 Evaluation Criteria

| Area | What We Look For |
|------|------------------|
| **Domain Modeling** | Sensible associations, validations, indexes |
| **Authorization** | Proper access controls per user |
| **Query Quality** | Correct and efficient quarterly commission logic |
| **Code Structure** | Clean and consistent design patterns, thin controllers, reusable components, etc. |
| **UI/UX** | Clear, consistent Bootstrap layout |
| **Documentation** | Setup clarity, rationale for design decisions |

---

## 🙌 Have Fun

Focus on writing code that reflects your normal Rails style and reasoning.
Show us how you think about modeling, querying, and building small, maintainable features.

Good luck, and happy coding!
