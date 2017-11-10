unmailboxes *

set imap_user = "USERNAME"
set imap_pass = "PASSWORD"
set smtp_url = "smtp://USERNAME@smtp.gmail.com:587/"
set smtp_pass = "PASSWORD"
set from = "EMAIL"
set realname = "Martin Vium"
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set header_cache = ~/.mutt/data/gmail.com/cache/headers
set message_cachedir = ~/.mutt/data/gmail.com/cache/bodies
set certificate_file = ~/.mutt/data/gmail.com/certificates
set ssl_starttls = yes
set ssl_force_tls = yes

macro index gi "<change-folder>=INBOX<enter>" "Go to inbox"
macro index ga "<change-folder>=[Gmail]/All Mail<enter>" "Go to all mail"
macro index gs "<change-folder>=[Gmail]/Sent Mail<enter>" "Go to sent mail"
macro index gt "<change-folder>=[Gmail]/Trash<enter>" "Go to trash"
macro index gd "<change-folder>=[Gmail]/Drafts<enter>" "Go to drafts"

macro index,pager y "<save-message>=[Gmail]/All Mail<enter><enter>" "Archive"
