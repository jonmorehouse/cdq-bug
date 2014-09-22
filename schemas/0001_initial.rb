schema "0001 initial" do
  entity "Connection" do
    boolean :is_user, optional: false, default: false

    string :account_id, optional: true
    string :phone_number, optional: true

    [:contact, :friend, :follower, :best_friend, :recent_friend].each do |type|
      boolean "is_#{type}", default: false
      string "#{type}_id", optional: true
    end

    [:created_at, :updated_at, :local_updated_at].each do |type|
      datetime type, optional: true
    end
  end
end
