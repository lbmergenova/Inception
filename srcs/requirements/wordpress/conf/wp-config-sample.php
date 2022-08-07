<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');
define('WP_HOME', 'wp_home_here');
define('WP_SITEURL', 'wp_seturl_here');

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '52g~wUA9-rM|9pOZoRS]/9!&}Za!wQOPxhPO+r ~;f8jb:{<--v-XefXkuzL^]i?');
define('SECURE_AUTH_KEY',  '2{yvqFocQe@Cr>f[$|5$#{iu+$5Q<[cFGZVMd+_FRY;JDiO9c/9qL8x&v|-xSq_1');
define('LOGGED_IN_KEY',    'ul0|9<6uF$V({7_f[(Qx=xq+-ctm(1!3>l8%EbsIE;%>e>2/|0Bv7??1,rH)o2yG');
define('NONCE_KEY',        '7(:$cA(WC<&|pXh+[RTX n/93zHOwN]41mt-H[FInbx++UXw-$ N{4j/f{q+k-n]');
define('AUTH_SALT',        'j-I*bol!8j>aPf~<ez_TYpa?t/S,*YeE2ahrnf~o{;lb+,zIa_~`!7EE/R}.$gz7');
define('SECURE_AUTH_SALT', 'WQy2c:?8~UX0tX9Phguu1(dQ6!c|:s<jAuJ%x_:>8GF)kD|;|aI4t)>nO|Za&ybE');
define('LOGGED_IN_SALT',   'FB?yfN`XjA ,:]q-hf/+QP^|3kZbKb2 1q]V84SscI=-!j,E 7LvBK1b^zm|&-(I');
define('NONCE_SALT',       '$@!(TxvWJR v|intT9i1|Ktcft::LL1{JyHGU*x|NRk5Gtr|-bEr5#<$D_h53c8a');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
