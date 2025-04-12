init: clean get generate

clean:
	echo "Cleaning the project.." ; \
	fvm flutter clean ; \

get:
	echo "Getting dependencies.." ; \
	flutter pub get ; \

generate:
	echo "Generating needed codes.." ; \
    dart run build_runner build --delete-conflicting-outputs ; \

# l10n:
# 	echo "Generating needed codes.." ; \
# 	fvm flutter gen-l10n ; \
