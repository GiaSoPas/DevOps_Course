package main

import (
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api"
	"log"
)

func main() {
	bot, err := tgbotapi.NewBotAPI("TOKEN")
	if err != nil {
		log.Panic(err)
	}

	bot.Debug = true

	log.Printf("Authorized on account %s", bot.Self.UserName)

	u := tgbotapi.NewUpdate(0)
	u.Timeout = 60

	updates, _ := bot.GetUpdatesChan(u)

	for update := range updates {
		if update.Message == nil { // ignore any non-Message updates
			continue
		}

		if !update.Message.IsCommand() { // ignore any non-command Messages
			continue
		}

		// Create a new MessageConfig. We don't have text yet,
		// so we leave it empty.
		msg := tgbotapi.NewMessage(update.Message.Chat.ID, "")

		// Extract the command from the Message.
		switch update.Message.Command() {
		case "start":
			msg.Text = "I am Project Bot for Andersen Course.\nYou can control me by sending these commands:\n" +
				"/start - start\n/help - commands\n/git - returns the address of my repository\n" +
				"/tasks - returns a numbered list of completed tasks\n/task1 - #1 A few details about myself\n" +
				"/task2 - #2 Small daily blog\n/task3 - #3 A one-liner into a nice script\n" +
				"/task4 - #4 python-flask-ansible\n/task5 - #5 telegram bot\n/task6 - #6 git-script\n" +
				"/task7 - #7 docker task"
		case "help":
			msg.Text = "See /start or /tasks command"
		case "tasks":
			msg.Text = "#1 A few details about myself\n" +
				"#2 Small daily blog\n#3 A one-liner into a nice script\n" +
				"#4 python-flask-ansible\n#5 telegram bot\n#6 git-script\n" +
				"#7 docker task"
		case "git":
			msg.Text = "https://github.com/GiaSoPas/DevOps_Course"
		case "task1":
			msg.Text = "https://github.com/GiaSoPas/DevOps_Course/tree/master/AboutMyself"
		case "task2":
			msg.Text = "https://github.com/GiaSoPas/DevOps_Course/tree/master/TIL"
		case "task3":
			msg.Text = "https://github.com/GiaSoPas/DevOps_Course/tree/master/Script"
		case "task4":
			msg.Text = "https://github.com/GiaSoPas/DevOps_Course/tree/master/python-flask-ansible"
		case "task5":
			msg.Text = "wait a while"
		case "task6":
			msg.Text = "https://github.com/GiaSoPas/DevOps_Course/tree/master/git-script"
		case "task7":
			msg.Text = "wait a while"
		default:
			msg.Text = "I don't know that command"
		}

		if _, err := bot.Send(msg); err != nil {
			log.Panic(err)
		}
	}
}