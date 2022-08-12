class Todo<ActiveRecord::Base
   def due_today?
    due_date=Date.today
   end

    def to_displayable_string
      display_status = completed ? "[X]" : "[ ]"
      dispaly_date=due_today ? nil : due_date
      "#{id}.#{display_status} #{todo_text} #{display_date}"
    end

    def self.show_list
      all.map{|todo| todo.to_displayable_string}
    end

    def self.overdue
      all.where("due_date < ?", Date.today)
    end

    def self.due_today
      all.where("due_date = ?", Date.today)
    end

    def self.due_later
      all.where("due_date > ?", Date.today)
    end
    
    def self.completed
      all.where(completed: true)
    end
    # def self.add_task(h)
    #   Todo.create!(
    #     toto_text: h[:todo-text],
    #     due_date: Date.today+h[:due_in_days],
    #     completed: false,
    #   )
    # end

    def self.show_list
      puts "My Todo-list\n\n"
      puts "Overdue\n"
      puts overdue.show_list
      puts "\n\n"

      puts "Due Today\n"
      puts due_today.show_list
      puts "\n\n"

      puts "Due later\n"
      puts due_later.show_list
      puts "\n\n"
    end

    def self.mark_as_completed!(id)
      todo=find(id)
      todo.completed=true
      todo.save!
      todo
    end
end