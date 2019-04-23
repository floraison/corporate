
module Corporate::Cases::Login
  class << self

    def authentify(user, pass)

      users = load_users

      u = users[user]
      return nil unless u

      return nil unless user == pass # ;-)

      u
    end

    protected

    def load_users

      (YAML.load(File.read('etc/passwd.yaml')) rescue {})
        .each { |k, v| v[:name] = k }
    end
  end
end

