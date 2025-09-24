extends Node

var _plugin_name = "FirebaseAnalyticsGodotPlugin"
var _singleton: Object


func _ready() -> void:
	if Engine.has_singleton(_plugin_name):
		_singleton = Engine.get_singleton(_plugin_name)
	else:
		push_warning("Couldn't find " + _plugin_name)


func logEvent(event: String, params: Dictionary) -> void:
	if _singleton:
		_singleton.logEvent(event, params)


func setUserProperty(property_name: String, value: String) -> void:
	if _singleton:
		_singleton.setUserProperty(property_name, value)


## https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event
class Event:
	const ADD_PAYMENT_INFO = "add_payment_info"
	const ADD_SHIPPING_INFO = "add_shipping_info"
	const ADD_TO_CART = "add_to_cart"
	const ADD_TO_WISHLIST = "add_to_wishlist"
	const AD_IMPRESSION = "ad_impression"
	const APP_OPEN = "app_open"
	const BEGIN_CHECKOUT = "begin_checkout"
	const CAMPAIGN_DETAILS = "campaign_details"
	const EARN_VIRTUAL_CURRENCY = "earn_virtual_currency"
	const GENERATE_LEAD = "generate_lead"
	const LEVEL_END = "level_end"
	const LEVEL_START = "level_start"
	const LEVEL_UP = "level_up"
	const LOGIN = "login"
	const POST_SCORE = "post_score"
	const PURCHASE = "purchase"
	const REFUND = "refund"
	const REMOVE_FROM_CART = "remove_from_cart"
	const SCREEN_VIEW = "screen_view"
	const SEARCH = "search"
	const SELECT_CONTENT = "select_content"
	const SELECT_ITEM = "select_item"
	const SELECT_PROMOTION = "select_promotion"
	const SHARE = "share"
	const SIGN_UP = "sign_up"
	const SPEND_VIRTUAL_CURRENCY = "spend_virtual_currency"
	const TUTORIAL_BEGIN = "tutorial_begin"
	const TUTORIAL_COMPLETE = "tutorial_complete"
	const UNLOCK_ACHIEVEMENT = "unlock_achievement"
	const VIEW_CART = "view_cart"
	const VIEW_ITEM = "view_item"
	const VIEW_ITEM_LIST = "view_item_list"
	const VIEW_PROMOTION = "view_promotion"
	const VIEW_SEARCH_RESULTS = "view_search_results"

## https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param
class Param:
	const ACHIEVEMENT_ID = "achievement_id"
	const ACLID = "aclid"
	const AD_FORMAT = "ad_format"
	const AD_PLATFORM = "ad_platform"
	const AD_SOURCE = "ad_source"
	const AD_UNIT_NAME = "ad_unit_name"
	const AFFILIATION = "affiliation"
	const CAMPAIGN = "campaign"
	const CAMPAIGN_ID = "campaign_id"
	const CHARACTER = "character"
	const CONTENT = "content"
	const CONTENT_TYPE = "content_type"
	const COUPON = "coupon"
	const CP1 = "cp1"
	const CREATIVE_FORMAT = "creative_format"
	const CREATIVE_NAME = "creative_name"
	const CREATIVE_SLOT = "creative_slot"
	const CURRENCY = "currency"
	const DESTINATION = "destination"
	const DISCOUNT = "discount"
	const END_DATE = "end_date"
	const EXTEND_SESSION = "extend_session"
	const FLIGHT_NUMBER = "flight_number"
	const GROUP_ID = "group_id"
	const INDEX = "index"
	const ITEMS = "items"
	const ITEM_BRAND = "item_brand"
	const ITEM_CATEGORY = "item_category"
	const ITEM_CATEGORY2 = "item_category2"
	const ITEM_CATEGORY3 = "item_category3"
	const ITEM_CATEGORY4 = "item_category4"
	const ITEM_CATEGORY5 = "item_category5"
	const ITEM_ID = "item_id"
	const ITEM_LIST_ID = "item_list_id"
	const ITEM_LIST_NAME = "item_list_name"
	const ITEM_NAME = "item_name"
	const ITEM_VARIANT = "item_variant"
	const LEVEL = "level"
	const LEVEL_NAME = "level_name"
	const LOCATION = "location"
	const LOCATION_ID = "location_id"
	const MARKETING_TACTIC = "marketing_tactic"
	const MEDIUM = "medium"
	const METHOD = "method"
	const NUMBER_OF_NIGHTS = "number_of_nights"
	const NUMBER_OF_PASSENGERS = "number_of_passengers"
	const NUMBER_OF_ROOMS = "number_of_rooms"
	const ORIGIN = "origin"
	const PAYMENT_TYPE = "payment_type"
	const PRICE = "price"
	const PROMOTION_ID = "promotion_id"
	const PROMOTION_NAME = "promotion_name"
	const QUANTITY = "quantity"
	const SCORE = "score"
	const SCREEN_CLASS = "screen_class"
	const SCREEN_NAME = "screen_name"
	const SEARCH_TERM = "search_term"
	const SHIPPING = "shipping"
	const SHIPPING_TIER = "shipping_tier"
	const SOURCE = "source"
	const SOURCE_PLATFORM = "source_platform"
	const START_DATE = "start_date"
	const SUCCESS = "success"
	const TAX = "tax"
	const TERM = "term"
	const TRANSACTION_ID = "transaction_id"
	const TRAVEL_CLASS = "travel_class"
	const VALUE = "value"
	const VIRTUAL_CURRENCY_NAME = "virtual_currency_name"
