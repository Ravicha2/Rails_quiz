class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string  :url
      t.string  :employer_name
      t.string  :employer_description
      t.string  :job_title
      t.string  :job_description
      t.integer :year_of_exp 
      t.string  :education
      t.string  :industry
      t.integer :salary
      t.integer :employment_type
      t.timestamps
    end
  end
end
