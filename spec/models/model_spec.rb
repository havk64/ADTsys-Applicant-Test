
RSpec.describe Model do
  context 'When creating Model' do
    # Testing model association and db columns
    it { should belong_to :make }
    it { should validate_presence_of :name }
    it { should have_db_column :name  }
    it { should have_db_column :make_id }
  end
end
