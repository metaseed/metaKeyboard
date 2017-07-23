; writing 'cj_site' followed by a space/Enter/Tab will PASTE the site URL
::cj_site::
	API.PasteText("http://clipjump.sourceforge.net")
	return

::1stClip::
	API.Paste(0,1)		; write '1stClip' to paste clip 1 of channel 0.
	return

::3clip::
	API.Paste(CN.NG, 3)    ; CN.NG has the current active channel number, this pastes 3rd clip of active channel
	return
::longstraddress::
	API.PasteText("103, Abc road`nCantt. Area`nXyz`nIndia")
	return
; EDIT THIS FILE TO ADD MORE AND RESTART TO HAVE THEM LOADED