# frozen_string_literal: true

module Radventure
  # Represents an ingame item
  #
  # @!attribute [r] name
  #   @return [String] The name of the item
  # @!attribute [r] type
  #   @return [String] The type (and subtype, where applicable) of the item
  # @!attribute [r] short_desc
  #   @return [String] The short description of the item
  # @!attribute [r] desc
  #   @return [String] The long description of the item
  # @!attribute [r] value
  #   @return [Float] The value (in gold pieces) of the item
  # @!attribute [r] weight
  #   @return [Float] The weight (in kilograms) of the item
  # @!attribute [r] is_magic
  #   @return [Boolean] Whether the item is magic or not
  # @!attribute [r] is_known
  #   @return [Boolean] Whether the item is known (as in the `Identify` spell) or not
  # @!attribute [r] true_name
  #   @return [String, nil] The true name of the item
  # @!attribute [r] true_type
  #   @return [String, nil] The true type (and possibly subtype) of the item
  # @!attribute [r] true_desc
  #   @return [String, nil] The true long description of the item
  #
  # @example Create new mundane item
  #   bucket = Item.new('Bucket',
  #                     'Gear',
  #                     'A simple wooden bucket.',
  #                     'A simple wooden bucket capable of containing around 5L of fluids.',
  #                     0.05,
  #                     0.9)
  # @example Create new magical item, yet unknown
  #   bag = Item.new('Leather Bag',
  #                  'Unknown Item',
  #                  'A small leather bag.',
  #                  'A small beige leather bag with miscellaneous details.',
  #                  2500,
  #                  7,
  #                  true,
  #                  false,
  #                  'Bag of Holding',
  #                  'Wondrous item, uncommon',
  #                  'This bag has an interior space considerably larger than its outside dimensions, roughly 2 feet in diameter at the mouth and 4 feet deep. The bag can hold up to 500 pounds, not exceeding a volume of 64 cubic feet. The bag weighs 15 pounds, regardless of its contents. Retrieving an item from the bag requires an action.\n\nIf the bag is overloaded, pierced, or torn, it ruptures and is destroyed, and its contents are scattered in the Astral Plane. If the bag is turned inside out, its contents spill forth, unharmed, but the bag must be put right before it can be used again.')
  class Item
    attr_reader :name, :type, :short_desc, :desc, :value, :weight, :is_magic, :is_known, :true_name, :true_type,
                :true_desc

    # Item constructor.
    #
    # @param name [String] The name of the item
    # @param type [String] The type (and subtype, where applicable) of the item
    # @param short_desc [String] The short description of the item
    # @param desc [String] The long description of the item
    # @param value [Float] The value (in gold pieces) of the item
    # @param weight [Float] The weight (in kilograms) of the item
    # @param is_magic [Boolean] Whether the item is magic or not
    # @param is_known [Boolean] Whether the item is known (as in the `Identify` spell) or not
    # @param true_name [String, nil] The true name of the item
    # @param true_type [String, nil] The true type (and possibly subtype) of the item
    # @param true_desc [String, nil] The true long description of the item
    # @return [Item] The Item object
    def initialize(name,
                   type,
                   short_desc,
                   desc,
                   value,
                   weight,
                   is_magic: false,
                   is_known: true,
                   true_name: nil,
                   true_type: nil,
                   true_desc: nil)
      @name       = name.strip
      @type       = type.strip
      @short_desc = short_desc.strip
      @desc       = desc.strip
      @value      = value.to_f
      @weight     = weight.to_f
      @is_magic   = is_magic ? true : false
      @is_known   = is_known ? true : false
      @true_name  = true_name.strip
      @true_type  = true_type.strip
      @true_desc  = true_desc.strip
    end
  end
end
