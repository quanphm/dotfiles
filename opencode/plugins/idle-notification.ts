import { dirname, join } from "path";
import { fileURLToPath } from "url";
import type { Plugin } from "@opencode-ai/plugin";

const __dirname = dirname(fileURLToPath(import.meta.url));
const SOUND_PATH = join(__dirname, "noti-sound.mp3");

export const IdleNotificationPlugin: Plugin = async ({ $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        const sessionId = event.properties.sessionID ?? "Unknown";

        await $`afplay -v 0.1 ${SOUND_PATH}`;

        const message = `${sessionId} is now idle/complete`;
        const hasTerminalNotifier = await $`which terminal-notifier`.quiet().then(
          () => true,
          () => false,
        );
        if (hasTerminalNotifier) {
          await $`terminal-notifier -title OpenCode -message ${message} -activate org.alacritty`;
        } else {
          const script = `display notification "${message}" with title "OpenCode"`;
          await $`osascript -e ${script}`;
        }
      }
    },
  };
};
