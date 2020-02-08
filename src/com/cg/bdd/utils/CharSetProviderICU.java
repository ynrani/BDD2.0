/******************************************************************************
 *
 *      CharSetProviderICU.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	09/02/17	NR		Modified to follow the naming and coding standards
 *	
 ******************************************************************************/

package com.cg.bdd.utils;

import java.nio.charset.Charset;
import java.nio.charset.spi.CharsetProvider;
import java.util.HashSet;
import java.util.Iterator;

/**
 * A CharsetProvider class which makes available the charsets provided by
 * Ronsoft. Currently there is only one, namely the X-ROT13 charset. This is not
 * a registered IANA charset, so it's name begins with "X-" to avoid name
 * clashes with offical charsets.
 * 
 * To activate this CharsetProvider, it's necessary to add a file to the
 * classpath of the JVM runtime at the following location:
 * META-INF/services/java.nio.charsets.spi.CharsetProvider
 * 
 * That file must contain a line with the fully qualified name of this class on
 * a line by itself: com.ronsoft.books.nio.charset.RonsoftCharsetProvider
 * 
 * See the javadoc page for java.nio.charsets.spi.CharsetProvider for full
 * details.
 * 
 * @author Ron Hitchens (ron@ronsoft.com)
 * @version $Id: RonsoftCharsetProvider.java,v 1.6 2002/05/20 07:24:31 ron Exp $
 *          Created: January, 2002
 */
public class CharSetProviderICU extends CharsetProvider {
	// The name of the charset we provide
	private static final String CHARSET_NAME = "X13";

	// A handle to the Charset object
	private Charset chrSet = null;

	/**
	 * Constructor, instantiate a Charset object and save the reference.
	 */
	public CharSetProviderICU() {
		this.chrSet = this.charsetForName(CHARSET_NAME);

		// new Charset (CHARSET_NAME, new String [0]);
	}

	/**
	 * Called by Charset static methods to find a particular named Charset. If
	 * it's the name of this charset (we don't have any aliases) then return the
	 * Rot13 Charset, else return null.
	 */
	public Charset charsetForName(String charsetName) {
		if (charsetName.equalsIgnoreCase(CHARSET_NAME)) {
			return (chrSet);
		}

		return (null);
	}

	/**
	 * Return an Iterator over the set of Charset objects we provide.
	 * 
	 * @return An Iterator object containing references to all the Charset
	 *         objects provided by this class.
	 */
	public Iterator<Charset> charsets() {
		HashSet<Charset> set = new HashSet<Charset>(1);

		set.add(chrSet);

		return (set.iterator());
	}
}
