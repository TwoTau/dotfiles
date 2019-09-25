#!/usr/bin/env python3

from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request

# If modifying these scopes, delete the file token.pickle.
SCOPES = ['https://www.googleapis.com/auth/gmail.readonly']

DIRPATH = os.path.split(os.path.abspath(__file__))[0]

def get_abs_path(local_file):
	return os.path.abspath(DIRPATH + '/' + local_file)

def get_unread():
	creds = None
	# The file token.pickle stores the user's access and refresh tokens, and is created automatically when the authorization flow completes for the first time.
	pickle_path = get_abs_path('token.pickle')
	if os.path.exists(pickle_path):
		with open(pickle_path, 'rb') as token:
			creds = pickle.load(token)
	# If there are no (valid) credentials available, let the user log in.
	if not creds or not creds.valid:
		if creds and creds.expired and creds.refresh_token:
			creds.refresh(Request())
		else:
			flow = InstalledAppFlow.from_client_secrets_file(get_abs_path('gmail-credentials.json'), SCOPES)
			creds = flow.run_local_server(port=0)
		# Save the credentials for the next run
		with open(pickle_path, 'wb') as token:
			pickle.dump(creds, token)

	service = build('gmail', 'v1', credentials=creds)

	results = service.users().messages().list(userId='me', q='is:unread').execute()

	if results and ('resultSizeEstimate' in results):
		return results['resultSizeEstimate']
	return '?'

if __name__ == '__main__':
	try:
		print(get_unread())
	except:
		# Probably not connected to the internet
		print()