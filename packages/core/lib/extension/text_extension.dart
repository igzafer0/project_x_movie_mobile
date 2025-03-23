extension TextStyleExtension on int {
  String movieGenreText() {
    return switch (this) {
      1 => "Explosions, speed, danger! The action never stops! 💥🔥",
      2 => "Suspense, tension, and adrenaline… Hold your breath! 😨🔪",
      3 => "Dive deep into emotions and unforgettable stories! 🎭💔",
      4 => "Cowboys, duels, and endless deserts! 🤠🌵",
      5 => "Get ready to laugh until you cry! 😂🎉",
      6 => "Magic, legends, and limitless imagination! 🏰🪄",
      7 => "Your heart will beat faster with this love story! ❤️🔥",
      8 => "Dark secrets and unsolved puzzles await! 🔍🕵️‍♂️",
      9 => "Feel the rhythm, let the melodies take over! 🎶🎸",
      10 => "A fine line between crime and justice! 🚔🔫",
      11 => "Imagination comes to life in vibrant colors! 🎨✨",
      12 => "Heartwarming moments for all ages! 👨‍👩‍👧‍👦💛",
      13 => "Are you sure you're alone in the dark? 👻😱",
      14 => "Gunpowder, steel, and epic battles! ⚔️🔥",
      15 => "The truth is more captivating than fiction! 🎥🌍",
      16 => "Dangerous journeys and undiscovered lands await! 🏕️🗺️",
      17 => "Epic tales from the dusty pages of the past! 📜🏛️",
      18 => "Technology, the unknown, and the infinite universe! 🚀👽",
      _ => "",
    };
  }
}
