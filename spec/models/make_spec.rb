
RSpec.describe Make do
  context "When creating Makes" do
    it { should have_many :models }
    it { should have_db_column :name }
    it { should have_db_column :webmotors_id }
  end
end
