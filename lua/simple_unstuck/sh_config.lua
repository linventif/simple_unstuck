//
// Configurations
//

// Unstuck
simpleUnstuck.Config.cooldown = 30 // Time in second before the player can unstuck again

// Algorithm Variables
simpleUnstuck.Config.maxTry = 20 // Max try of the algorithm before giving up
simpleUnstuck.Config.maxDistance = 96 // Max distance use by the algorithm to find a valid position

// Chat Trigger
simpleUnstuck.Config.word = {
    ["unstuck"] = true,
    ["stuck"] = true,
    ["bloquer"] = true
} // Words that trigger the unstuck

// Console Command
simpleUnstuck.Config.command = {
    ["simple_unstuck"] = true,
    ["unstuck"] = true,
} // Dev console command that trigger the unstuck