# Social assets

`carousels/` contains generated five-slide copy: the claim, the Old Testament
text, the claimed New Testament fulfilment, the strongest Christian case, and
the assessment. Bible text comes from the pinned BSB corpus. The general-audience
slides come from `plain-language.json` and follow [STYLE_GUIDE.md](STYLE_GUIDE.md).
Suggested post captions and their five hashtags come from `captions.json`. They are
copied into each generated carousel manifest so the images, alt text and posting
copy travel together.
`backgrounds.json` records image provenance and licence metadata. Each claim under
the local, Git-ignored `rendered/` directory contains two visual masters:

- `instagram/`: 1080×1350 (4:5), also suitable for Bluesky;
- `vertical/`: 1080×1920 (9:16), with a shared TikTok/YouTube safe area.

Regenerate copy and images from the repository root:

```sh
scripts/generate_publication_copy.pl
scripts/render_carousels.pl
```

The durable copy of every rendered image is the private
`s3://social.nonprophet.app/rendered/` archive; rendered JPEGs are not stored in
Git. Rendering automatically uploads generated claim directories when the local
`nonprophet-social` AWS profile is available. That profile uses the restricted
`nonprophet-social-uploader` IAM user, which can manage objects only in this
bucket. Its credentials are local machine configuration and must never be added
to the repository.

Set `NONPROPHET_SKIP_UPLOAD=1` to render without uploading. Site validation does
this automatically. To upload existing renders directly, optionally naming one
or more claim IDs, run:

```sh
scripts/upload_social_images.sh prophecy-090
```

Restore the complete rendered archive from S3 with:

```sh
scripts/download_social_images.sh
```

Pass claim IDs to restore only those claims:

```sh
scripts/download_social_images.sh prophecy-089 prophecy-090
```

The commands use these optional environment variables:

- `NONPROPHET_AWS_PROFILE` changes the AWS profile from `nonprophet-social`;
- `NONPROPHET_SOCIAL_BUCKET` changes the bucket from `social.nonprophet.app`;
- `NONPROPHET_RENDERED_DIR` changes the restore destination from
  `social/rendered/`.

The upload command exits successfully without uploading when its AWS profile is
unavailable, allowing rendering on machines without archive credentials. The
restore command treats a missing profile as an error because restoration was
explicitly requested.

The current pilot uses one Unsplash photograph consistently across a carousel set.
Attribution is included on every slide even though the Unsplash License does not
require it. Alt text remains in the carousel JSON for use when publishing.
