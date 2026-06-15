import { tool } from "@opencode-ai/plugin"

export default tool({
  description: "Send a Telegram notification to the user",
  args: {
    message: tool.schema.string().describe("The message to send"),
  },
  async execute(args) {
    const token = process.env.TELEGRAM_BOT_TOKEN
    const chatId = process.env.TELEGRAM_CHAT_ID

    if (!token || !chatId) {
      return "TELEGRAM_BOT_TOKEN or TELEGRAM_CHAT_ID not set"
    }

    const url = `https://api.telegram.org/bot${token}/sendMessage`
    const res = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        chat_id: parseInt(chatId),
        text: args.message,
      }),
    })

    const data = await res.json()
    return data.ok ? "Notification sent" : `Failed: ${data.description}`
  },
})
