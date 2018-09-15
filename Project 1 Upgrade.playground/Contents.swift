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
    
    // Create two player list Array, be ready to store divided experienced and inexperienced players.
    var experiencedTeam = [[String: Any]]()
    var inexperiencedTeam = [[String: Any]]()
    
    // Create a for-loop to iterate over the playerList to seperate experienced and inexperienced players,
    // and append them to the Arraies experiencedTeam and noExperiencedTeam created above.
    for player in playerList{
        if let experienced = player[soccerExperience] as? Bool{
            if experienced{
                experiencedTeam.append(player)
            } else {
                inexperiencedTeam.append(player)
            }
        }
    }
    
    // Create a for-loop(Bubble Sort) to swap the players' positions in the Array; make the tallest go to the last position, and
    // the shortest player goes to first position in the experiencedTeam Array.
    var swapped = false
    if experiencedTeam.count >= 2 {
        repeat {
            var swapped = false
            for i in 0...experiencedTeam.count - 2 {
                for j in 0...experiencedTeam.count - i - 2 {
                    if let player1 = experiencedTeam[j][Height] as? Double, let player2 = experiencedTeam[j + 1][Height] as? Double {
                        if player1 > player2 {
                            experiencedTeam[j...j + 1] = [experiencedTeam[j + 1], experiencedTeam[j]]
                            swapped = true
                        }
                    }
                }
            }
        } while swapped
    }
    
    // Create a for-loop(Bubble Sort) to swap the players' positions in the Array; make the shortest go to the last position, and
    // the tallest player goes to first position in the inexperiencedTeam Array.
    if inexperiencedTeam.count >= 2 {
        repeat {
            swapped = false
            for i in 0...inexperiencedTeam.count - 2 {
                for j in 0...inexperiencedTeam.count - i - 2 {
                    if let player1 = inexperiencedTeam[j][Height] as? Double, let player2 = inexperiencedTeam[j + 1][Height] as? Double {
                        if player1 < player2 {
                            inexperiencedTeam[j...j + 1] = [inexperiencedTeam[j + 1], inexperiencedTeam[j]]
                            swapped = true
                        }
                    }
                }
            }
        } while swapped
    }
    
    // Create a variable named 'teamTurn', used as index in later function to iterate over the allTeams to append one player a time into one of the three teams.
    var teamturn = 0
    
    // This function is to make index back to 0 after 2, so the index should always be 0, 1, 2.
    func teamTurn() {
        teamturn += 1
        if teamturn > 2 {
            teamturn = 0
        }
    }
    
    // This function takse two parameters of [[String: Any]] type, it will use inexperiencedTeam and experiencedTeam as parameters.
    // This function will iterate the inexperiencedTeam and experiencedTeam. While the temporary inexpeirenced and experienced group still has players,
    // the while loop will append one player at a time into the allTeams list start from index 0.
    // Appending one player at a time is to making sure that the number of players and number of experienced players each team are balanced as closed as possible.
    // Since the experienced team sorted from shortest player to tallest and inexperienced team is tallest to shortest, and index for both while-loop starts from 0, three teams average height will be balanced enough.
    func appendPlayersFrom(inexTeam: [[String: Any]], exTeam: [[String: Any]]) {
        var teamInEx = inexTeam
        var teamEx = exTeam
        while teamInEx.count > 0 {
            allTeams[teamturn].append(teamInEx.remove(at: 0))
            teamTurn()
        }
        teamturn = 0
        while teamEx.count > 0 {
            allTeams[teamturn].append(teamEx.remove(at: 0))
            teamTurn()
        }   
    }
    
    appendPlayersFrom(inexTeam: inexperiencedTeam, exTeam: experiencedTeam)
    
    // Create three dictionaries to have team names, practice date and time, and assign divided players in allTeams array to each team.
    // So each divided team in allTeams list has a name and practice date and time now.
    let teamSharks: [String: Any] = [teamName: "Team Sharks", practiceDateAndTime: "March 17, 3pm", teamPlayers: allTeams[0]]
    let teamDragons: [String: Any] = [teamName: "Team Dragon", practiceDateAndTime: "March 17, 1pm", teamPlayers: allTeams[1]]
    let teamRaptors: [String: Any] = [teamName: "Team Raptors", practiceDateAndTime: "March 18, 1pm", teamPlayers: allTeams[2]]
    
    // Add all three teams' information into a new array named teamList.
    // This array will be used later when printng out individual letters.
    var teamList = [teamSharks, teamRaptors, teamDragons]

    // Create a variable as a index in the for-loop when we iterate the letters Array to print out each letter.
    var letterIndex = 0
    
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
                    letterIndex += 1
                }
            }
        }
    }
    
    // Create a function inside, that takes teamList array as the parameter.
    // The function will iterate all players of each team of teamList, and calucate their average height.
    // it will also print out the three teams' average heights and their team name.
    func calculateAverageHeight(teamList: [[String: Any]]) {
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
    calculateAverageHeight(teamList: teamList)
}

divideTeams(playerList: players)

















