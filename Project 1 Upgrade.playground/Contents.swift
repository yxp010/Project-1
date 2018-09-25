// Create constants for convience to be used as the keys in the dictionaries that store all players information.
let playerName = "Name"
let soccerExperience = "experienced?"
let guardiansName = "Guardian Name(s)"
let Height = "Height"

// Convert yes and no to Boolean value true and false to be used as value of key "soccerExperience".
let yes = true
let no = false

// Create constant dictionaries[String: Any] to store all players' information including:
// playerName: String, Height: Double, soccerExperience: Bool, parentsName: String.
let player1: [String: Any] = [playerName: "Joe Smith", Height: 42.0, soccerExperience: yes, guardiansName: "Jim and Jan Smith"]
let player2: [String: Any] = [playerName: "Jill Tanner", Height: 36.0, soccerExperience: yes, guardiansName: "Clara Tanner"]
let player3: [String: Any] = [playerName: "Bill Bon", Height: 43.0, soccerExperience: yes,  guardiansName: "Sara and Jenny Bon"]
let player4: [String: Any] = [playerName: "Eva Gordon", Height: 45.0, soccerExperience: no,  guardiansName: "Wendy and Mike Gordon"]
let player5: [String: Any] = [playerName: "Matt Gill", Height: 40.0, soccerExperience: no, guardiansName: "Charles and Sylvia Gill"]
let player6: [String: Any] = [playerName: "Kimmy Stein", Height: 41.0, soccerExperience: no, guardiansName: "Bill and Hillary Stein"]
let player7: [String: Any] = [playerName: "Sammy Adams", Height: 45.0, soccerExperience: no, guardiansName: "Jeff Adams"]
let player8: [String: Any] = [playerName: "Karl Saygan", Height: 42.0, soccerExperience: yes, guardiansName: "Heather Bledsoe"]
let player9: [String: Any] = [playerName: "Suzane Greenberg", Height: 44.0, soccerExperience: yes, guardiansName: "Henrietta Dumas"]
let player10: [String: Any] = [playerName: "Sal Dali", Height: 41.0, soccerExperience: no, guardiansName: "Gala Dali"]
let player11: [String: Any] = [playerName: "Joe Kavalier", Height: 39.0, soccerExperience: no, guardiansName: "Sam and Elaine Kavalier"]
let player12: [String: Any] = [playerName: "Ben Finkelstein", Height: 44.0, soccerExperience: no, guardiansName: "Aaron and Jill Finkelstein"]
let player13: [String: Any] = [playerName: "Diego Soto", Height: 41.0, soccerExperience: yes, guardiansName: "Robin and Sarika Soto"]
let player14: [String: Any] = [playerName: "Chloe Alaska", Height: 47.0, soccerExperience: no, guardiansName: "David and Jamie Alaska"]
let player15: [String: Any] = [playerName: "Arnold Willis", Height: 43.0, soccerExperience: no, guardiansName: "Claire Willis"]
let player16: [String: Any] = [playerName: "Phillip Helm", Height: 44.0, soccerExperience: yes, guardiansName: "Thomas Helm and Eva Jones"]
let player17: [String: Any] = [playerName: "Les Clay", Height: 42.0, soccerExperience: yes, guardiansName: "Wynonna Brown"]
let player18: [String: Any] = [playerName: "Herschel Krustofski", Height: 45.0, soccerExperience: yes, guardiansName: "Hyman and Rachel Krustofski"]

// Put all players' information into a constant array named players.
let players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

// Create three empty arraies of dictionaries to represent three teams: team1, team2, team3. I will append players into 3 teams and then name each team later.
var team1 = [[String: Any]]()
var team2 = [[String: Any]]()
var team3 = [[String: Any]]()
var allTeams = [team1, team2, team3]

// Create three constants to be used as each team's dictionary keys later.
let teamName = "Team name"
let practiceDateAndTime = "Practice date and time"
let teamPlayers = "Players"

// Create a array to store all letters.
var letters = [String]()

// Create a function that takes one parameter(playerList: [[String: Any]]).
// Function can divide players into three balanced teams automatically.
// It also automatically print out individual letter for each player and print out the average height of each team.
func divideTeams(playerList: [[String: Any]]) {
    
    var allPlayers = playerList
    let firstTeam = 0
    
    // Use a simple Bubble sort to swap all players positions.
    // Reposition the players from the shortest to tallest.
    var swapped = false
    var turn = 1
    let leastNumberOfPlayers = 2
    if allPlayers.count >= leastNumberOfPlayers {
        repeat {
            swapped = false
            for i in 0..<allPlayers.count - turn {
                if let player1 = allPlayers[i][Height] as? Double, let player2 = allPlayers[i + 1][Height] as? Double {
                    if player1 > player2 {
                        allPlayers[i...i + 1] = [allPlayers[i + 1], allPlayers[i]]
                        swapped = true
                    }
                }
            }
            turn += 1
        } while swapped
    }
    
    // Create two player list Array, be ready to store divided experienced and inexperienced players.
    var experiencedTeam = [[String: Any]]()
    var inexperiencedTeam = [[String: Any]]()
    
    // Create a for-loop to iterate over the playerList to seperate experienced and inexperienced players,
    // and append them to the Arraies that are experiencedTeam and noExperiencedTeam created above.
    // Each temporary group, experiencedTeam and inexperiencedTeam, has the order that is from shortest to tallest.
    for player in allPlayers {
        if let experienced = player[soccerExperience] as? Bool{
            if experienced {
                experiencedTeam.append(player)
            } else {
                inexperiencedTeam.append(player)
            }
        }
    }
    
    // Create a variable named 'teamTurn', used as index in later function to iterate over the allTeams to append one player a time into one of the three teams.
    var teamTurn = 0
    turn = 1
    // This helper function is to make index back to 0 after 2, so the index should always be 0, 1, 2.
    func chageTeamTurn() {
        teamTurn += turn
        
        if teamTurn > allTeams.count - 1 {
            teamTurn = firstTeam
        }
    }
    
    // Create a boolean variable to be used as a condition to switch the order the function appending players.
    // If the first time appeding players to three teams is from the shortest to tallest, the next time will be from the tallest to shortest.
    var fromShortest = true
    
    // Create a helper function uses experiencedTeam or inexperiencedTeam as parameter.
    // This function will append players from the temporary group into each team one player at a time until the teamporary group is empty.
    // Only appending one player at a time is because we need to balance number of players in each team no matter the total number of players is dividable by number of teams or not.
    // If fromShortest is true, this function will append players from the shortest to tallest. If fromShortest is false, the function will append players from tallest to shortest. It makes average heights of three teams are pretty closed.
    // If after we ran this function and fromShortest remained false, next time we call this function will append players from tallest to shortest due to fromShortest is false.
    // The function needs to check every time if there is enough players in the tempGroup after it appends a player into a team becasue there might be some situations that the number of players in the original tempGroup is not evenly dividable by three teams.
    func appendPlayersFrom(temporaryGroup: [[String: Any]]) {
        
        var tempGroup = temporaryGroup
        
        while tempGroup.isEmpty == false {
            if fromShortest {
                allTeams[teamTurn].append(tempGroup.removeFirst())
                chageTeamTurn()
                if tempGroup.isEmpty == false {
                    allTeams[teamTurn].append(tempGroup.removeFirst())
                    chageTeamTurn()
                    if tempGroup.isEmpty == false {
                        allTeams[teamTurn].append(tempGroup.removeFirst())
                        chageTeamTurn()
                    }
                }
                fromShortest = false
            } else if fromShortest == false {
                allTeams[teamTurn].append(tempGroup.removeLast())
                chageTeamTurn()
                if tempGroup.isEmpty == false {
                    allTeams[teamTurn].append(tempGroup.removeLast())
                    chageTeamTurn()
                    if tempGroup.isEmpty == false {
                        allTeams[teamTurn].append(tempGroup.removeLast())
                        chageTeamTurn()
                    }
                }
                fromShortest = true
            }
        }
    }
    // Call appendPlayersFrom helper function twice using experiencedTeam and inexperiencedTeam respectively.
    // After this, each team in allPlayers Array will have closed average height and balanced number of experienced players.
    appendPlayersFrom(temporaryGroup: experiencedTeam)
    // Since experiencedTeam has 9 players and we have three teams, the function will append players from the tallest to shortest due to fromShortest is false now.
    appendPlayersFrom(temporaryGroup: inexperiencedTeam)
    
    // Create three dictionaries to have team names, practice date and time, and assign a team in allTeams Array to each team.
    // So each team in allTeams Array has a name and practice date and time now.
    let teamSharks: [String: Any] = [teamName: "Team Sharks", practiceDateAndTime: "March 17, 3pm", teamPlayers: allTeams[0]]
    let teamDragons: [String: Any] = [teamName: "Team Dragon", practiceDateAndTime: "March 17, 1pm", teamPlayers: allTeams[1]]
    let teamRaptors: [String: Any] = [teamName: "Team Raptors", practiceDateAndTime: "March 18, 1pm", teamPlayers: allTeams[2]]
    
    // Add all three teams' information into a new Array named teamList.
    // This array will be iterated later to print out individual letters.
    let teamList = [teamSharks, teamRaptors, teamDragons]
    
    // Create a variable as a index in the for-loop when we iterate the letters Array to print out each letter.
    // Actually I do not understand why I need to append each letter into letters array, but it is a requirement. If not, I won't need this variable.
    var letterIndex = 0
    let changeLetterIndexBy = 1
    
    // Create a nested for-loop, iterate each team in teamList and print out the individul letter for each player.
    // Letter includes guadians' name, player's name, team name, and practice date and time.
    // Each sub for-loop will create a personal letter, and append the letter to the letters array we created above.
    // Each sub for-loop will also print out the personal letter and add 1 to letterIndex variable to for the next loop use.
    for team in teamList {
        if let teamPlayers = team[teamPlayers] as? [[String: Any]], let teamName = team[teamName] as? String, let teamPracticeTime = team[practiceDateAndTime] as? String {
            
            for player in teamPlayers {
                if let playerName = player[playerName] as? String, let parentsName = player[guardiansName] as? String {
                    letters.append("\(parentsName), your kid \(playerName) has been chosen to \(teamName). Please come to attend the first team team practice at \(teamPracticeTime).")
                    print(letters[letterIndex])
                    letterIndex += changeLetterIndexBy
                }
            }
        }
    }
    
    // Create a nested for-loop to calculate all three teams average height and print it out.
    var sumOfHeight: Double = 0
    var averageHeight: Double
    for team in teamList {
        if let players = team[teamPlayers] as? [[String: Any]], let teamName = team[teamName] as? String {
            for player in players {
                if let playerHeight = player[Height] as? Double {
                    sumOfHeight += playerHeight
                }
            }
            averageHeight = sumOfHeight / Double(players.count)
            print("\(teamName)'s average height is \(averageHeight).")
            sumOfHeight = 0
        }
    }
}

divideTeams(playerList: players)











