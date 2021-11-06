* Actor - Account
* Command - Sign in to Tasks Auth
* Data - Account id + Account role
* Event - `account.sign_in`

---

* Actor - Account
* Command - Sign in to Dashboard Auth
* Data - Account id + Account role
* Event - `account.sign_in`

---

* Actor - Account
* Command - Create new task
* Data - Task + Accound id
* Event - `task.created`

---

* Actor - Event `task.created`
* Command - Calculate task costs
* Data - Task
* Event - `task.cost_calculated`

---

(this event is unclear - should it be one event for every task, or one for for all tasks? I guess every task has it's own command. Because buisiness requirements on how to select task to assign might change. And should there be a 'pick open tasks' command? Idk)
* Actor - Account (admin only)
* Command - Task assign shuffle
* Data - Tasks
* Event - Multiple `task.assigned` I guess

---

* Actor - Account
* Command - Complete a task
* Data - Task
* Event - `task.completed`

---

* Actor - Event `task.cost_calculated`
* Command - Widthraw money on task assignment
* Data - Task + Balance
* Event - `balance.changed`

---

* Actor - Event `task.completed`
* Command - Add money on task completion
* Data - Task + Balance
* Event - `balance.changed`

---

* Actor - Event `balance.changed`
* Command - Create balance log
* Data - Task + BalanceLog
* Event - `balance_log.created`

---

* Actor - End of the day?
* Command - Calculate account balance
* Data - Account id + Account balance
* Event - `balance.calculated`

---

* Actor - Event `balance.calculated`
* Command - Send email
* Data - Account id + Account balance
* Event - `balance.email_sent`

---

* Actor - Event `balance.calculated`
* Command - Apply balance event log
* Data - Balance event log
* Event - `balance_event_log.applied`

---
