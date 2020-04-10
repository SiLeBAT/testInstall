KNIME_FILE="knime_3.7.2.linux.gtk.x86_64.tar.gz"
KNIME37="https://update.knime.org/analytics-platform/3.7"
OLD_FSK="https://dl.bintray.com/silebat/fsklab_icpmf"
NEW_FSK="https://dl.bintray.com/silebat/fsklab_test"

wget -v "http://download.knime.org/analytics-platform/linux/$KNIME_FILE"
tar -xzf $KNIME_FILE
rm $KNIME_FILE

echo "INSTALLING OLD FSK (ICPMF)"
knime_3.7.2/knime -application org.eclipse.equinox.p2.director -repository "$KNIME37,$OLD_FSK" -installIU de.bund.bfr.knime.fsklab.feature.feature.group
knime_3.7.2/knime -application org.eclipse.equinox.p2.director -lir

echo "REMOVING OLD FSK"
knime_3.7.2/knime -application org.eclipse.equinox.p2.director -uninstallIU de.bund.bfr.knime.fsklab.feature.feature.group
knime_3.7.2/knime -application org.eclipse.equinox.p2.director -lir

echo "INSTALLING NEW FSK (test)"
knime_3.7.2/knime -application org.eclipse.equinox.p2.director -repository "$KNIME37,$NEW_FSK" -installIU de.bund.bfr.knime.fsklab.feature.feature.group
knime_3.7.2/knime -application org.eclipse.equinox.p2.director -lir

echo "CLEANING KNIME"
rm -Rf knime_3.7.2
