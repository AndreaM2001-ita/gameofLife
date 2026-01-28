# 🎮 Game of Life Mobile App

## ✨ Explore the Cellular Universe

Welcome to **Game of Life**, an interactive mobile application that brings Conway's cellular automaton to life! Watch as simple rules create fascinating patterns, watch cells evolve, and discover the beauty of emergent complexity right on your phone.

---

## 🌟 Features

- 🎲 **Random Grid Generation** - Start with a random cellular configuration at the tap of a button
- ⚙️ **Custom Simulations** - Create your own initial grid state and watch it evolve
- ⏯️ **Adjustable Speed Control** - Drag to control simulation speed from slow contemplation to rapid evolution
- 👆 **Interactive Cells** - Tap and manage individual cells in real-time
- 📊 **Grid Visualization** - Beautiful visual representation of your cellular automaton on a large grid
- 📁 **Save & Load** - Persist your favorite grids to JSON files for later exploration
- 🧪 **Comprehensive Testing** - Built with rigorous unit, black-box, and UI testing

---

## 🎯 How It Works

Conway's Game of Life follows these simple rules:

1. **Survival**: A live cell with 2-3 neighbors survives
2. **Birth**: A dead cell with exactly 3 neighbors becomes alive
3. **Death**: All other cells die or stay dead

From these simple rules emerges incredibly complex and beautiful behavior!

---

## 📱 Supported Platforms

- 📲 **iOS** - Fully optimized for iPhone
- 🤖 **Android** - Complete Android support with appropriate permissions

---

## 🚀 Getting Started

### Prerequisites

- Corona SDK installed on your system
- Lua 5.1 or higher
- Basic understanding of mobile app development (optional but helpful)

### Installation & Running

1. Clone or download the repository
2. Open the project in Corona SDK
3. Run the simulator or build for your target platform

```bash
# The app automatically runs tests on startup
# You'll see unit testing, black-box testing, and UI testing output in the console
```

### Building for iOS/Android

Use Corona SDK's build system to create deployable packages:
- For iOS: Generate .ipa files for distribution
- For Android: Generate .apk files

---

## 🎮 Game Controls

- **Random Start** 🎲 - Generate a random initial state
- **Load Grid** 📂 - Load a previously saved grid configuration
- **Play/Pause** ⏯️ - Start or stop the simulation
- **Speed Control** 🎚️ - Drag the speed slider to adjust evolution pace
- **Cell Management** ✏️ - Tap cells to toggle their state

---

## 🏗️ Project Structure

```
gameofLife/
├── main.lua                 # Entry point of the application
├── config.lua              # Corona configuration settings
├── build.settings          # Build and platform settings
├── grid.json               # Sample grid data file
│
├── Modulus/                # Core game modules
│   ├── menuScene.lua       # Main menu interface
│   ├── cellScene.lua       # Grid visualization and simulation
│   ├── cellTable.lua       # Grid data structure and logic
│   ├── cellFile.lua        # File I/O for grids
│   ├── inputScene.lua      # User input handling
│   ├── manageScene.lua     # Scene management
│   ├── fetchScene.lua      # Grid fetching utilities
│   └── stopElements.lua    # UI stop button functionality
│
├── Tests/                  # Comprehensive test suite
│   ├── unitTesting.lua     # Unit tests for core functions
│   ├── blackBoxTesting.lua # Black-box integration tests
│   └── UITesting.lua       # User interface tests
│
├── Images.xcassets/        # iOS app icons
├── LaunchScreen.storyboardc/ # iOS launch screen
└── AndroidResources/       # Android-specific resources
```

---

## 🧪 Testing

The application includes a comprehensive testing suite that runs automatically:

- **Unit Testing** 🧩 - Tests individual functions and components
- **Black-Box Testing** 📦 - Tests system behavior without checking internal logic
- **UI Testing** 🖼️ - Validates user interface interactions

Check the console output at startup to see all test results.

---

## ⚙️ Configuration

### Grid Size
Edit `main.lua` to adjust the grid dimensions:
```lua
cellNumber = 30  -- Number of cells per side (30x30 grid)
```

### Display Settings
Modify `config.lua` to change:
- Screen width and height
- Frame rate (fps)
- Content scaling

---

## 👤 Author

**Andrea Marcosano** (Student #10541054)

---

## 📝 License

This project is created for educational purposes as part of a mobile application development course.

---

## 🔗 Resources

- [Corona Labs Documentation](https://docs.coronalabs.com/)
- [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
- [Lua Programming Guide](https://www.lua.org/docs.html)

---

## 🎓 Learning Highlights

This project demonstrates:
- ✅ Mobile app development with Corona SDK
- ✅ Cellular automaton implementation
- ✅ Object-oriented programming in Lua
- ✅ File I/O and data persistence
- ✅ UI/UX design for mobile platforms
- ✅ Comprehensive software testing practices

---

**Enjoy exploring the infinite patterns of Life! 🌌**
