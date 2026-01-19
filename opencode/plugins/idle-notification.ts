import type { Plugin } from "@opencode-ai/plugin"
import { dirname, join } from "path"
import { fileURLToPath } from "url"

const __dirname = dirname(fileURLToPath(import.meta.url))
const SOUND_PATH = join(__dirname, "noti-sound.mp3")

export const IdleNotificationPlugin: Plugin = async ({ $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        const sessionId = event.properties.sessionID ?? "Unknown"

        await $`afplay -v 0.3 ${SOUND_PATH}`

        // show macOS notification (terminal-notifier preferred, osascript fallback)
        const message = `${sessionId} is now idle/complete`
        const hasTerminalNotifier = await $`which terminal-notifier`.quiet().then(() => true, () => false)
        if (hasTerminalNotifier) {
          await $`terminal-notifier -title OpenCode -message ${message} -activate org.alacritty`
        } else {
          const script = `display notification "${message}" with title "OpenCode"`
          await $`osascript -e ${script}`
        }
      }
    },
  }
}
