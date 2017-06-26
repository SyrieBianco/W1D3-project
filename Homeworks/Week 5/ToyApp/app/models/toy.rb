# First, create a Toy model and build a polymorphic belongs_to
# association on toyable. Refer to the polymorphic association reading
# for syntax. Also, you'll probably want to handle validation of the
# toy's uniqueness constraint on :name and :toyable (toyable_type and
# toyable_id in the database). Refer to the Rails documentation for
# information on uniqueness scope.
#
# Next, build corresponding has_many associations in the Corgi and
# Cat models. These should both be named toys. Again, refer to the reading.
#
# Run rake db:seed. Check that your associations work as expected.

class Toy < ActiveRecord::Base
  belongs_to :toyable, polymorphic: true

  validates :name, uniqueness: { scope: [:toyable] }
end
