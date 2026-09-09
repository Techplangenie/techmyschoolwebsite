# Tech My School — Website

The new techmyschool.org: a fast, static, 7-page site with no WordPress, no plugins, no monthly hosting bill.

**Pages:** `index.html` (Home) · `about.html` · `services.html` · `conference.html` · `resources.html` · `donate.html` · `contact.html`

---

## One-time setup (dummy site first, domain later)

### 1. Pull in the images (run once, on your machine)

The pages reference local images in `assets/`. Download them from the current WordPress site with:

```bash
node scripts/fetch-assets.mjs
```

That fills `assets/` with the logo and all photos (~11 files). After this, the site is fully self-contained and WordPress can eventually be shut off.

### 2. Push to GitHub

```bash
git init
git add .
git commit -m "New techmyschool.org site"
```

Create an empty repo on GitHub (e.g. `Techplangenie/tms-website`), then:

```bash
git remote add origin git@github.com:Techplangenie/tms-website.git
git branch -M main
git push -u origin main
```

### 3. Import to Vercel → instant dummy site

1. In Vercel: **Add New → Project** → import `tms-website`.
2. Framework preset: **Other**. No build command, no output directory — it's plain static files. Just click **Deploy**.
3. ~30 seconds later you have your dummy site at something like **`tms-website.vercel.app`**. Share it, test it on your phone, click everything.

Every future `git push` auto-deploys in ~30–45 seconds, same as your other projects.

### 4. When you're happy: point the domain (the real switch)

1. In the Vercel project: **Settings → Domains** → add `techmyschool.org` and `www.techmyschool.org`.
2. Vercel shows you the DNS records to set. At your DNS provider (wherever techmyschool.org's DNS lives), set the `A` record for `techmyschool.org` to Vercel's IP and the `CNAME` for `www` to `cname.vercel-dns.com` (use exactly what Vercel displays).
3. Wait a few minutes for DNS + automatic SSL. Done — your domain now serves this site.
4. Keep the WordPress hosting alive for a week or two as a fallback, then cancel it.

---

## Known TODOs before/after launch

- **Conference "Register here" buttons** (`conference.html`): waiting on the 2027 registration link — currently show "Registration opens soon" on click.
- **Contact form** (`contact.html`): currently opens the visitor's mail app pre-filled. For an on-page form, create a free form endpoint at formspree.io and swap it in.
- **Newsletter form** (`index.html`): dummy — needs the email provider's signup endpoint.
- Old WordPress URLs (e.g. `/our-mission/`) will 404 after cutover. If search-engine continuity matters, redirects can be added via a `vercel.json` — ask Claude.

## Making changes

Each page is a single self-contained HTML file (styles + scripts inline). Edit, commit, push — Vercel redeploys automatically. Or just ask Claude to make the change and push what it hands back.
