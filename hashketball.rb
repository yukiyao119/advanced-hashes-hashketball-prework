# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => ["Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12, 
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }, "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12, 
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      }, "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19, 
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      }, "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11, 
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      }, "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2, 
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => ["Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1, 
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      }, "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4, 
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      }, "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12, 
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }, "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3, 
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      }, "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12, 
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]
    }
  }
end 

def num_points_scored(name)
  result = 0 
  game_hash.collect do |location, team_data|
    # binding.pry
    team_data.collect do |attribute, data|
      # binding.pry
      if attribute == :players
      # binding.pry
        data.collect do |data_item|
          if data_item.keys.include?(name)
            # binding.pry
            result = data_item[name][:points]
            # binding.pry
          end 
        end
      end
    end
  end
  result
end 

def shoe_size(name)
  result = 0 
  game_hash.collect do |location, team_data|
    # binding.pry
    team_data.collect do |attribute, data|
      # binding.pry
      if attribute == :players
      # binding.pry
        data.collect do |data_item|
          if data_item.keys.include?(name)
            # binding.pry
            result = data_item[name][:shoe]
            # binding.pry
          end 
        end
      end
    end
  end
  result
end 

def team_colors(team_name)
  game_hash.collect do |location, team_data|
    # binding.pry
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end 

def team_names
  result = []
  game_hash.collect do |location, team_data|
    result << team_data[:team_name]
  end 
  result
end 

def player_numbers(team_name)
  result = []
  game_hash.collect do |location, team_data|
    if team_data[:team_name] == team_name
      # binding.pry
      team_data[:players].collect do |player|
        # binding.pry
        player.collect do |each_player|
          result << each_player[1][:number]
          # binding.pry
        end
      end 
    end 
  end 
  result
end 

def player_stats(name)
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      # binding.pry
      if attribute == :players
      # binding.pry
        data.collect do |data_item|
          # binding.pry , data_item is hash 
          if data_item.keys.include?(name)
            # binding.pry
            return data_item[name]
            # binding.pry
          end 
        end
      end
    end
  end 
end 

def big_shoe_rebounds
  max_shoe_size = 0
  max_shoe_size_player = ''
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, attribute_data|
      if attribute == :players 
        attribute_data.collect do |players_data|
          # binding.pry
          # players_data is hash , players_data.keys = arr of names 
          player_names = players_data.keys
          player_names.collect do |player_name|
            cur_player_shoe_size = shoe_size(player_name)
            # binding.pry
            if cur_player_shoe_size >= max_shoe_size
              max_shoe_size = cur_player_shoe_size
              max_shoe_size_player = player_name
            end 
            # binding.pry
          end 
        end 
      end 
    end 
  end 
  max_shoe_size_player
  # binding.pry
  player_stats(max_shoe_size_player)[:rebounds]
  # binding.pry
end 

def most_points_scored
  max_point = 0
  max_point_player = ''
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, attribute_data|
      if attribute == :players 
        attribute_data.collect do |players_data|
          # binding.pry
          # players_data is hash , players_data.keys = arr of names 
          player_names = players_data.keys
          player_names.collect do |player_name|
            if num_points_scored(player_name) >= max_point
              max_point = num_points_scored(player_name)
              max_point_player = player_name
            end 
          end 
        end 
      end 
    end 
  end
  max_point_player
end 

def winning_team
  home_points = 0 
  game_hash[:home][:players].collect do |players_data|
    # players_data is hash, players_data.keys is names
    home_points_arr = players_data.keys.collect do|name|
      num_points_scored(name)
    end
    home_points = home_points_arr.reduce(:+)
  end
  home_points
  # binding.pry
  
  away_points = 0 
  game_hash[:away][:players].collect do |players_data|
    away_points_arr = players_data.keys.collect do|name|
      num_points_scored(name)
    end
    away_points = away_points_arr.reduce(:+)
  end
  away_points
  # binding.pry

  if home_points > away_points
    game_hash[:home][:team_name]
  elsif
    game_hash[:away][:team_name]
  end
end 

def player_with_longest_name
  longest_name = ''
  longest_name_length = 0 
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |data_item|
          # data_item is hash 
          player_names = data_item.keys.collect do |name|
            if name.length >= longest_name_length
              longest_name_length = name.length
              longest_name = name 
            end 
          end 
        end
      end
    end
  end
  longest_name
end 

def long_name_steals_a_ton?
  max_steals = 0
  max_steals_player = ''
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, attribute_data|
      if attribute == :players 
        attribute_data.collect do |players_data|
          # players_data is hash , keys = arr of names 
          name_arr = players_data.keys
          name_arr.collect do |name|
            player_stats(name)[:steals]
            # binding.pry
            if player_stats(name)[:steals] >= max_steals 
              max_steals = player_stats(name)[:steals]
              max_steals_player = name 
              # binding.pry
            end 
          end
        end 
      end 
    end 
  end
  max_steals_player
  # binding.pry
  
  if max_steals_player == player_with_longest_name
    true 
  else 
    false
  end 
end 


