# GitHub

Some things I will probably need to do again in the future.

## GitHub Pages


### Adding a Custom Domain Using a Canonical Name Record (CNAME)
Normally GitHub Pages are accessible through `username.github.io/repository`, however you can set up your github pages to be accessible from a custom URL.

1. Obtain an Apex level domain name, e.g. `example.com`

2. Activate GitHub Pages for the repository (Through the settings > GitHub Pages). After you do this the webpage is available at `https://USERNAME.github.io/REPOSITORY/`. Next we'll assign your custom domain.
3. Create a file called `CNAME` in the root of the repository and put your domain name in this file.

4. In your DNS provider create a `CNAME` record pointing to `USERNAME.github.io` or `ORGANIZATION.github.io`

5. Test DNS configuration:

    ```bash
    dig EXAMPLE.COM +noall +answer +nocmd
    > ;example.com.                          IN        A
    > example.com.               275         IN        CNAME    USERNAME.github.io.
    > USERNAME.github.io.        3584        IN        A        185.199.108.153
    > USERNAME.github.io.        3584        IN        A        185.199.111.153
    > USERNAME.github.io.        3584        IN        A        185.199.110.153
    > USERNAME.github.io.        3584        IN        A        185.199.109.153
    ```

### Adding a Custom Domain Using an Apex Record (A)
Note, GitHub is set up to use Canonical Name records (`CNAME`).
It is preferable to set up a `CNAME` record, but if you need to use an Apex level record this is how you would do it.
Steps 1-3 are the same as creating A `CNAME` record.

4. On your DNS Providor's portal create an A record for your domain to each of the GitHub Pages IP Addresses: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, and `185.199.111.153`. You will need to create a separate DNS record for each IP Address. Note: I also had to add a separate DNS record for `example.com` and `www.example.com` for eash IP address.

5. Test DNS configuration:

    ```bash
    dig EXAMPLE.COM +noall +answer
    > EXAMPLE.COM     3600    IN A     185.199.108.153
    > EXAMPLE.COM     3600    IN A     185.199.109.153
    > EXAMPLE.COM     3600    IN A     185.199.110.153
    > EXAMPLE.COM     3600    IN A     185.199.111.153
    ```
    You should see all four ip addresses in the `dig` output.

One of the benefits of a CNAME record are that multiple subdomains or different can be linked to different repositories or projects in the same organization.
For example, both `subdomain1.example.com` and `subdomain2.example.com` can point to `USER.github.io` and be linked to separate repositories.
While it will still work if you set Apex level records for each subdomain, GitHub will send you a warning email everytime you update these websites.

#### Enabling HTTPS:
When you first enable GitHub Pages you will see an option to **Enforce HTTPS**. At first there will be a message that says your domain isn't configured to enable SSL. However, if you wait for a bit you should see the message: _Not yet available for your site because the certificate has not finished being issued. Please allow 24 hours for this process to complete_. So, it seems like this works itself out. Come back in a day and check this box.


#### References
[GitHub: Managing a custom domain for you github pages site](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)
[GitHub: Securing your GitHub Pages site with HTTPS](https://docs.github.com/en/free-pro-team@latest/articles/securing-your-github-pages-site-with-https)
[GitHub Pages Docs](https://pages.github.com/)
