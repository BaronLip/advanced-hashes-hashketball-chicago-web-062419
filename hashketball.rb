require "pry"

def game_hash
    {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => "Black, White",
            :players => {
                :Alan_Anderson => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1,
                }, 
                :Reggie_Evans => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7,
                },
                :Brook_Lopez => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                :Mason_Plumlee => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                :Jason_Terry => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => "Turquoise, Purple",
            :players => {
                :Jeff_Adrien => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                :Bismack_Biyombo => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                :DeSagna_Diop => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                :Ben_Gordon => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                :Brendan_Haywood => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                }       
            }
        }
    }
end


def num_points_scored(name)
    player_points = ""

    game_hash.each do |location, team_data|
        team_data[:players].each do |player_name, player_stats|
            # binding.pry
            if player_name.to_s.sub("_", " ") == name 
                # binding.pry
                player_points = player_stats[:points]
            end
        end
    end
    player_points
end


def shoe_size(name) 
    player_shoe = ""

    game_hash.each do |location, team_data|
        team_data[:players].each do |player_name, player_stats|
            if player_name.to_s.sub("_", " ") == name 
                    player_shoe = player_stats[:shoe]
            end
        end
    end
    player_shoe
end


def team_colors(team_name)
    this_teams_colors = ""

    game_hash.each do |location, team_data|
        team_data.each do |team_attributes, team_values|
            if team_name == team_values
                this_teams_colors = team_data[:colors].split(", ")
            end
        end
    end
this_teams_colors
end


def team_names
    teams = []
    
    game_hash.each do |location, team_data|
        team_data.each do |team_attributes, team_values|
            if team_attributes == :team_name
                teams << team_values
            end
        end
    end
    teams
end

def player_numbers(team_name)
    jersey_numbers = []

    game_hash.each do |location, team_data|
        team_data.each do |team_attributes, team_values|
            if team_values == team_name
                team_data[:players].each do |player_name, player_stats|
                    jersey_numbers << player_stats[:number]
                end
            end
        end
    end
    jersey_numbers
end


def player_stats(player_name)
    stats_hash = {}
    
    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|
            # binding.pry
            if player.to_s.sub("_", " ") == player_name
                stats_hash = player_stats
            end
        end
    end
    stats_hash
end

def big_shoe_rebounds
    has_biggest_shoes = 0
    rebounds = 0

    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|
            if has_biggest_shoes < player_stats[:shoe]
                # binding.pry
                has_biggest_shoes = player_stats[:shoe]
                rebounds = player_stats[:rebounds]
            end
        end
    end
    rebounds
end


def most_points_scored
    highest_points = 0
    player_with_the_most = ""

    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|
            if highest_points < player_stats[:points]
                highest_points = player_stats[:points]
                player_with_the_most = player.to_s.sub("_", " ")
                # binding.pry
            end
        end
    end
    player_with_the_most
end

def winning_team
    home_points = 0
    away_points = 0
    winning_team = ""

    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|
            if location == :home
                home_points = home_points + player_stats[:points]
            elsif location == :away 
                away_points = away_points + player_stats[:points]
            end

            if home_points > away_points
                winning_team = game_hash[:home][:team_name]
            elsif away_points > home_points
                winning_team = game_hash[:away][:team_name]
            end 
        end
    end
    winning_team
end


def player_with_longest_name
    longest_name = ""

    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|
            if longest_name.length <= player.to_s.sub("_", " ").length
                longest_name = player.to_s.sub("_", " ")
            end
        end
    end
    longest_name
end

def long_name_steals_a_ton
    longest_name = ""
    most_steals = ""

    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|

            if longest_name.length <= player.to_s.sub("_", " ").length
                longest_name = player.to_s.sub("_", " ")
            end

            if most_steals <= player_stats[:steals]
                most_steals = player.to_s.sub("_", " ")
            end

        end
    end
    longest_name == most_steals
end

