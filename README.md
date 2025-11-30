# VHDL_Ariel  
VHDL Course Projects & Exercises  
Ariel University • Sahar Frimovitz

---

## 📘 Overview
This repository contains all VHDL projects, exercises, simulations, and testbenches developed as part of the VHDL coursework and independent learning.

The goal is to keep everything organized and synchronized between two development machines:
- 🖥️ Windows (HP)
- 💻 macOS (Mac)

This README describes the correct workflow to avoid merge conflicts and ensure smooth Git synchronization across both machines.

---

# 🔁 Git Workflow (Two Machines)

To ensure clean and conflict-free work, always follow this protocol when switching between computers.

---

## 🟦 1. Before You Start Working (Every Session)
Always pull the latest version from GitHub:

```bash
git pull

🟩 2. During Work

Work normally:
	•	Edit VHDL files
	•	Add new architectures
	•	Create testbenches
	•	Run simulations
	•	Add supporting files

No Git commands are required while working.

⸻

🟥 3. After You Finish Working

When you’re done for the day or switching computers:

Stage all changes:
git add .
Commit with a clear message:
git commit -m "Updated VHDL files / testbenches"
Push to GitHub:
git push
Now the other machine will see your changes immediately.

🟨 4. When Moving to the Other Computer

Before you touch anything — pull again:
git pull
This updates the local copy and prevents conflicts.

🔥 Summary (Most Important)

# 1. למשוך עדכונים לפני עבודה
git pull

# 2. לעבוד, לשנות קבצים...

# 3. לבדוק מה השתנה
git status

# 4. להוסיף לקומיט
git add .

# 5. ליצור קומיט
git commit -m "Project 3 - Q1 and TB"

# 6. לדחוף ל-GitHub
git push

Following this simple cycle ensures zero conflicts and keeps both environments perfectly in sync.

