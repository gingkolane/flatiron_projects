class AddColumnsToCompletion < ActiveRecord::Migration[5.2]
  def change
    add_column :completions, :incompleteReason, :string
    add_column :completions, :issueType, :string
    add_column :completions, :problemAnalysis, :string
    add_column :completions, :suggestedFix, :string
    add_column :completions, :status, :integer, :default => 0
  end
end
