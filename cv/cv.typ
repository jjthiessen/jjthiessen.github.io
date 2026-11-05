#import "cv-theme.typ": cv, section, job, en, code, quote-box, ulink

#cv(
  name: [Jonathan Thiessen],
  address: [Grand Forks~BC],
  contacts: (
    (text: "https://tangential.ca", link: "https://tangential.ca"),
    (text: "cv.enquiry@alonzo.church", link: "mailto:cv.enquiry@alonzo.church"),
  ),
  // Insertion order = endnote numbering, matching the XML footer.
  endnotes: (
    footnotes: [I wish that I had something clever to say here.],
    afol: [Adult Fan Of LEGO®],
    consumer: [As a user],
    sunshine: [A former privately owned ISP and cable company acquired by Shaw Communications Inc.],
    validity: [Date of issue to date of expiry.],
  ),
)[
  #section[Foreword][
    I've been a human all my life.
    Sometimes I like to do computery things.
    Please mind the footnotes#en("footnotes", stack: true).

    I have some interest in espresso, mixology, zymurgy, mycoculture, fountain pens, and the formal sciences.
    I'm a bit of an AFOL#en("afol") (but not quite enough to take out a second mortgage).
    I'm partial to declarative, functional, and effect-oriented programming (including IaC and CM).

    Please see your associated cover letter for more details (if applicable).
    References and private personal project samples available on request.
    Public repositories and open source contributions are available though a combination of #ulink("https://github.com/jjthiessen")[GitHub], #ulink("https://gitlab.com/tangential")[GitLab], #ulink("https://git.clan.lol/tangential?tab=activity")[git.clan.lol], and scattered across bug trackers and mailing lists.
  ]

  #section[Employment and Contracting][
    #job(
      org: (name: "TeraGo Networks Inc", link: "https://terago.ca"),
      title: [DevOps Consultant],
      type: [Contract],
      skills: (
        "Linux",
        "Puppet",
        "Docker",
        "Nix",
        "SalesForce (Apex, LWC)",
        "MuleSoft (Anypoint)",
        "Local AI",
        "Python",
        "ReScript",
        "DuckDB",
        "Consul",
        "Vault",
        "Terraform",
        "Git",
        "GitLab",
        "Jira",
        "BIND",
        "PowerDNS",
        "NSD",
        "Unbound",
        "Cisco ASA",
        "Bash Scripting",
        "Nushell",
        (text: "VMware Cloud Director", note: "consumer"),
        "IP Networking",
      ),
      dates: ((start: "2024.02", end: "2026.10"),),
      location: [Remote],
      details: (
        [Miscellaneous systems integrations and platform development],
        [Network device management improvements],
        [Design and implementation of a network device utilisation monitoring system],
        [Local AI classification and extraction pilot projects],
      ),
    )
    #job(
      org: (name: "TeraGo Networks Inc", link: "https://terago.ca"),
      title: [DevOps Consultant],
      type: [Contract (Fractional Retainer)],
      details: (
        [Ad hoc secondary support for platform continuity],
      ),
      dates: ((start: "2022.02", end: "2024.01"),),
      location: [Remote],
    )
    #job(
      org: (name: "AAA Internet Publishing Inc (DBA WTFast)", link: "https://www.wtfast.com"),
      title: [Senior Software Developer],
      skills: (
        "Go",
        "NATS",
        "Linux",
        "Puppet",
        "Docker",
        "GCP",
        "Nix",
        "Terraform",
        "Git",
        "GitHub",
        "Redis",
        "Neo4j",
        "Bash Scripting",
        "IP Networking",
      ),
      dates: ((start: "2022.01", end: "2023.12"),),
      location: [Remote],
      details: (
        [Designed and authored backend APIs and data processing services],
        [Deployed and operated NATS clusters],
        [Wrote just enough Puppet, Terraform, and Nix to be self-sufficient],
        [Fumbled through GCP without breaking anything],
      ),
    )
    #job(
      org: (name: "TeraGo Networks Inc", link: "https://terago.ca"),
      title: [Various Roles],
      dates: ((start: "2011.06", end: "2021.12"),),
      location: [Remote],
      nested: {
        job(
          org: (name: "TeraGo Networks Inc", link: "https://terago.ca"),
          title: [Manager, Operational Support Systems],
          dates: ((start: "2017.01", end: "2021.12"),),
          location: [Remote],
        )
        job(
          org: (name: "RackForce Networks Inc", link: "https://rackforce.com"),
          title: [Manager, Operational Support Systems],
          dates: ((start: "2016.10", end: "2017.01"),),
          location: [Remote],
        )
        job(
          org: (name: "RackForce Networks Inc", link: "https://www.rackforce.com"),
          title: [Manager, Operational Support Systems],
          skills: (
            "Linux",
            "Puppet",
            "Docker",
            "AWS",
            "Consul",
            "Vault",
            "Nomad",
            "Terraform",
            "PHP",
            "Percona",
            "Git",
            "GitLab",
            "Jira",
            "Confluence",
            "BIND",
            "PowerDNS",
            "NSD",
            "Unbound",
            "Cisco ASA",
            "Bash Scripting",
            "VMware vSphere",
            (text: "VMware vCloud Director", note: "consumer"),
            "IP Networking",
          ),
          dates: ((start: "2014.03", end: "2016.10"),),
          location: [Kelowna~BC],
          details: (
            [Plan, oversee, and actively engage in the development of our applications and associated integrations],
            [Maintain operational, configuration, and other procedures (#emph[e.g.,] disaster recovery)],
            [Research and evaluate technologies and techniques],
            [Provision and maintain production servers],
          ),
        )
        job(
          org: (name: "RackForce Networks Inc", link: "https://www.rackforce.com"),
          title: [Developer],
          skills: (
            "PHP",
            "MariaDB",
            "Web Markup (HTML, CSS, Bootstrap)",
            "jQuery",
            "Git",
            "Stash (Bitbucket Server)",
            "Jira",
            "Confluence",
            "Linux",
            "Puppet",
            "Bash Scripting",
            "Apache HTTPD",
            "nginx",
            "D3.js",
            "R",
            "PostgreSQL",
            "VMware vSphere",
            "IP Networking",
          ),
          dates: ((start: "2013.10", end: "2014.03"),),
          location: [Kelowna~BC],
          details: (
            [Develop and deploy web applications],
            [Provision and maintain production servers],
          ),
        )
        job(
          org: (name: "RackForce Networks Inc", link: "https://www.rackforce.com"),
          title: [NOC Supervisor],
          skills: (
            "Linux",
            "Bash Scripting",
            "D3.js",
            "R",
            "MySQL",
            "PostgreSQL",
            "VMware vSphere",
            "Cisco IOS",
            "Cisco NX-OS",
            "IP Networking",
          ),
          dates: ((start: "2013.01", end: "2013.10"),),
          location: [Kelowna~BC],
          details: (
            [Design and maintain analytics for support metrics],
            [Provide recommendations for NOC process improvements],
            [Manage employee scheduling and develop alternative models for shift rotations],
            [Respond to support requests and incidents where required],
            [Author and perform network and systems change requests where required],
          ),
        )
        job(
          org: (name: "RackForce Networks Inc", link: "https://www.rackforce.com"),
          title: [NOC Technician],
          skills: (
            "Linux",
            "Virtuozzo",
            "cPanel",
            "Plesk",
            "Bash Scripting",
            "Apache HTTPD",
            "PHP",
            "MySQL",
            "BIND",
            "Postfix",
            "Windows Server",
            "VMware ESXi",
            "VMware vSphere",
            "Cisco IOS",
            "Cisco NX-OS",
            "IP Networking",
          ),
          dates: ((start: "2011.06", end: "2013.01"),),
          location: [Kelowna~BC],
          details: (
            [Respond to support requests and incidents],
            [Author and perform network and systems change requests],
            [RHEL/CentOS server administration],
            [(Basic) Windows Server administration],
          ),
        )
      },
    )
    #job(
      org: (name: "Shaw Communications Inc", link: "https://www.shaw.ca"),
      title: [Internet Technician],
      type: [Contract],
      details: (
        [Legacy systems documentation, maintenance, and migrations],
      ),
      dates: (
        (start: "2008.05", end: "2008.08"),
        (start: "2007.05", end: "2007.08"),
      ),
      location: [Grand Forks~BC],
    )
    #job(
      org: (name: "Sunshine Communications Ltd", note: "sunshine"),
      title: [Internet Technician],
      skills: (
        "Linux",
        "PHP",
        "MySQL",
        "Perl",
        "Web Markup (HTML, CSS)",
        "Bash Scripting",
        "Apache HTTPD",
        "BIND",
        "Sendmail",
        "Radius",
        "DOCSIS",
        "SNMP",
        "Riverstone (RS 8000)",
        "Cisco IOS",
        "IP Networking",
      ),
      dates: ((start: "2004.10", end: "2006.08"),),
      location: [Grand Forks~BC],
      details: (
        [Network design, maintenance, and troubleshooting],
        [Linux server administration],
        [Customer technical support],
        [Development of customer management and provisioning systems],
      ),
    )
  ]

  #section[Education and Certificates][
    #job(
      org: (name: "Amazon Web Services", link: "https://aws.amazon.com"),
      title: (name: "AWS Certified Developer - Associate (DVA)", link: "https://aws.amazon.com/certification/certified-developer-associate"),
      dates: ((start: "2017.12.14", end: "2020.12.14", note: "validity"),),
      location: [Kelowna~BC],
    )
    #job(
      org: (name: "ITIL", link: "https://www.axelos.com/best-practice-solutions/itil"),
      title: (name: "ITIL v3 Foundations", link: "https://www.axelos.com/certifications/itil-certifications/itil-foundation"),
      dates: ((start: "2012.12", note: "validity"),),
      location: [Kelowna~BC],
    )
    #job(
      org: (name: "University of Waterloo", link: "https://uwaterloo.ca"),
      summary: [BMath, Joint Honours #ulink("https://uwaterloo.ca/math/future-undergraduates/programs/computer-science")[Computer Science] & #ulink("https://uwaterloo.ca/math/future-undergraduates/programs/combinatorics-and-optimization")[Combinatorics and Optimization]],
      dates: ((start: "2006.09", end: "2011.04"),),
      location: [Waterloo~ON],
    )
    #job(
      org: (name: "Cisco Networking Academy", link: "https://www.netacad.com"),
      title: (name: "Cisco Certified Network Associate (CCNA)", link: "https://www.cisco.com/site/us/en/learn/training-certifications/certifications/enterprise/ccna/index.html"),
      dates: ((start: "2004.06.29", end: "2007.06.29", note: "validity"),),
      location: [Kelowna~BC],
    )
  ]

  #section[Favourite #code[fortune] Quote][
    #quote-box[
      [I plan] to see, hear, touch, and destroy everything in my path, including beets, rutabagas, and most random vegetables, but excluding yams, as I am absolutely terrified of yams…

      Actually, I think my fear of yams began in my early youth, when many of my young comrades pelted me with same for singing songs of far-off lands and deep blue seas in a language closely resembling that of the common sow.
      My psychosis was further impressed into my soul as I reached adolescence, when, while skipping through a field of yams, light-heartedly tossing flowers into the stratosphere, a great yam-picking machine tore through the fields, pursuing me to the edge of the great plantation, where I escaped by diving into a great ditch filled with a mixture of water and pig manure, which may explain my tendency to scream, #emph[“Here come the Martians! Hide the eggs!”] every time I have pork.
      But I digress.
      The fact remains that I cannot rationally deal with yams, and pigs are terrible conversationalists.
    ]
  ]
]
