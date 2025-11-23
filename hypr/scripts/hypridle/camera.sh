cd "/run/media/f4/EOS_DIGITAL/DCIM/101CANON"

for picture in *.JPG; do
	if [ -f "$picture" ]; then
		setsid kitten icat --stdin=no --transfer-mode=file "$picture"
		case $(printf "Keep\nDelete\nedit\nedit-raw" | gum choose) in

		Keep)
			continue
			;;

		Delete)
			echo "yes"
			gum confirm "Delete $picture + RAW?" && rm $picture && rm "$(basename ${picture%.*}.CR2)"
					
			continue
			;;

		edit)
			gimp $picture
			exit
			;;

		edit-raw)
			darktable "$(basename ${picture%.*}.CR2)"
			exit
			;;

		*)
			exit
			;;

		esac

	fi
done

filename="file.txt"
extension=${filename##*.}
echo "The file extension is: $extension"


