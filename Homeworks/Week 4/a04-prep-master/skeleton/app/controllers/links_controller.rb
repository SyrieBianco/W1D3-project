# LinksController
#   GET #new
#     when logged in
#       renders the new links page
#     when logged out
#       redirects to the login page (FAILED - 6)
#   POST #create
#     when logged out
#       redirects to the login page (FAILED - 7)
#     when logged in
#       with invalid params
#         validates the presence of title and body (FAILED - 8)
#       with valid params
#         redirects to the link show page (FAILED - 9)
#   GET #index
#     when logged in
#       renders the new links page
#     when logged out
#       redirects to the login page (FAILED - 10)
#   GET #show
#     when logged in
#       renders the link show page (FAILED - 11)
#     when logged out
#       redirects to the login page (FAILED - 12)
#   GET #edit
#     when logged in
#       renders the edit link page (FAILED - 13)
#     when logged out
#       redirects to the login page (FAILED - 14)
#   PATCH #update
#     when logged in as a different user
#       should not allow users to update another users links (FAILED - 15)
#     when logged in as the correct user
#       should not allow users to update another users links (FAILED - 16)

class LinksController < ApplicationController
end
