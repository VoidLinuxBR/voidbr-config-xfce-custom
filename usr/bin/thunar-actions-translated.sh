#!/usr/bin/env bash

# Set localization environment variables for translations
export TEXTDOMAINDIR="/usr/share/locale"
export TEXTDOMAIN=comm-xfce-config


#Text to translate
TextNameTerminal=$"Open Terminal Here"
TextDescExample=$"Example for a custom action"

TextNameOpenRoot=$"Open as root"
TextDescOpenRoot=$"Open directories as root"

TextNameConvertAudioAndVideo=$"Convert audio and video"
TextDescConvertAudioAndVideo=$"Audio and video converter"

TextNameConvertImages=$"Convert png to jpg &amp; jpg to png"
TextDescConvertImages=$"Images conversor"


# Read Action Script
read -d $'' ShowText <<EOF

<?xml version="1.0" encoding="UTF-8"?>
<actions>
<action>
	<icon>utilities-terminal</icon>
	<name>$TextNameTerminal</name>
	<submenu></submenu>
	<unique-id>1705535866617524-1</unique-id>
	<command>exo-open --working-directory %f --launch TerminalEmulator</command>
	<description>$TextExample</description>
	<range></range>
	<patterns>*</patterns>
	<startup-notify/>
	<directories/>
</action>
<action>
	<icon>folder-root</icon>
	<name>$TextNameOpenRoot</name>
	<submenu></submenu>
	<unique-id>1717269872235866-1</unique-id>
	<command>sudo thunar %f</command>
	<description>$TextDescOpenRoot</description>
	<range></range>
	<patterns>*</patterns>
	<directories/>
	<audio-files/>
	<image-files/>
	<other-files/>
	<text-files/>
	<video-files/>
</action>
<action>
	<icon>gtk-convert</icon>
	<name>$TextNameConvertAudioAndVideo</name>
	<submenu></submenu>
	<unique-id>1717615776203492-1</unique-id>
	<command>mystiq %f</command>
	<description>$TextDescConvertAudioAndVideo</description>
	<range></range>
	<patterns>*</patterns>
	<audio-files/>
	<video-files/>
</action>
<action>
	<icon>kdenlive-select-images</icon>
	<name>$TextNameConvertImages</name>
	<submenu></submenu>
	<unique-id>1717616241433404-2</unique-id>
	<command>convert %f \$(basename %f .jpg).png,convert %f \$(basename %f .png).jpg</command>
	<description>$TextDescConvertImages</description>
	<range></range>
	<patterns>*</patterns>
	<image-files/>
</action>
</actions>

EOF

# Add folder if not exit
mkdir -p ~/.config/Thunar

# Save content in uca.xml file
echo "$ShowText" > ~/.config/Thunar/uca.xml
