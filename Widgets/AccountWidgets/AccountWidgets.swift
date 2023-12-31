//
//  AccountWidgets.swift
//

import SwiftUI
import WidgetKit
import GitHubData
import Nuke

struct AccountWidgets: Widget {  
  var body: some WidgetConfiguration {
    AppIntentConfiguration(
      kind: "Account Widgets",
      provider: AccountTimelineProvider()
    ) { entry in
      AccountEntryView(entry: entry)
        .padding(10)
        .containerBackground(for: .widget) {
          LinearGradient(
            colors: [
              entry.color,
              entry.color.opacity(0.6)
            ],
            startPoint: .bottom,
            endPoint: .top
          )
        }
    }
    .contentMarginsDisabled()
    .supportedFamilies([.systemSmall])
  }
}

#Preview(as: .systemSmall) {
  AccountWidgets()
} timeline: {
  AccountEntry(date: .now, user: .zunda, color: .cyan, icon: PlatformImage(data: .sampleIcon))
}

extension Image {
  #if os(macOS)
  init(image: PlatformImage) {
    self.init(nsImage: image)
  }
  #else
  init(image: PlatformImage) {
    self.init(uiImage: image)
  }
  #endif
}

extension GitHubData.User {
  static let zunda = GitHubData.User(
    id: 1234,
    userID: "zunda-pixel",
    userName: "zunda",
    nodeID: "",
    avatarURL: URL(string: "https://avatars.githubusercontent.com/u/47569369?v=4")!,
    gravatarID: "",
    url: URL(string: "https://github.com")!,
    htmlURL: URL(string: "https://github.com")!,
    followersURL: URL(string: "https://github.com")!,
    followingURL: URL(string: "https://github.com")!,
    subscriptionsURL: URL(string: "https://github.com")!,
    organizationsURL: URL(string: "https://github.com")!,
    reposURL: URL(string: "https://github.com")!,
    eventsURL: URL(string: "https://github.com")!,
    receivedEventsURL: URL(string: "https://github.com")!,
    gistsURL: URL(string: "https://github.com")!,
    starredURL: URL(string: "https://github.com")!,
    publicRepoCount: 1,
    totalPrivateRepoCount: 2,
    ownedPrivateRepoCount: 3,
    publicGistsCount: 2,
    privateGistsCount: 3,
    followerCount: 3,
    followingCount: 4,
    createdAt: .now,
    updatedAt: .now,
    bio: "bio",
    email: "email",
    location: "Japan",
    hireable: true,
    type: .user,
    score: 1,
    siteAdmin: true,
    twitterUserName: "zunda_pixel",
    company: "Apple",
    diskUsage: 12312,
    collaboratorCount: 0,
    twoFactorAuthentication: false,
    plan: .init(
      name: "free",
      space: 32,
      collaboratorCount: 342,
      privateRepoCount: 4234
    )
  )
}

extension Data {
  static let sampleIcon = Data(base64Encoded: """
/9j/2wCEAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDIBCQkJDAsMGA0NGDIhHCEyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIAZABkAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/ANSiiivKO0KKKKACiiigAooooAKKKKACiiigAooooAKKKKACil2seik/hTlhkY4CMT9KAGUVZTT7p/uwsfxAqdND1B/u25I/3h/jRqOzM+itUeHtRP8Ayxx/wIf404eHL89UA/Ef40WYWZkUVtDw1enrtH4j/GnDwvdnrIg/CizDlfYw6K3x4VuD1nQfgaU+FLgdJ4z+Bosw5Wc/RW6fC90OkqU0+GbzsVP+frRZhysxKK2D4bvh0UfmP8aYfD2ojpCD/wACH+NFmFmZVFaTaDqS8m3OP94f41A2mXifehI/EH+tGoWZUoqRoJUOGjYfhTCjDqpH4UCEooPFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU5UdzhFZj6AE1et9EvrjBWEqD3Y4/nQlcaTZn0V0sHhUkAzT49VC/1zWlD4fsIQCYy577jkfrTUWPlZxQRn+6rH6DNWIdOu5/uQMfqMfzru47O2ix5cEa47hQKnAwMCnylKHc4uHw3fPjeojB9SD/I1fi8KAAGW4z7Bcf1rpaKaih8qMaLw1Ypy3mMfcgj+VW49IsIxxbRt7soP9KvUU7IdkQraWyfdgjX6KBUoAAwAAPalooAKKKKBhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABgEYNRNbQv8AeiRvqoNS0UCKcml2Mg5tYQfUIM/yqpL4csJOiup/2SB/SteiiyCxzkvhSM58qcr/ALwzVGbwxdpny2En0AH8zXY0UuUXKjgJtKvYM74GGPQg/wAqqNG6feRl+oIr0qoZLW3mz5kMb5/vKDS5ROB5zRXbT+H7GbJCFD22nA/IVl3HhaVQTBLv9AQB+pNJxZPKznaKuXGl3tsTvgfA7qMj9KqEEHBBBHYikS0JRRRQAUUUUAFFFFABRRRQAUUVYsbR726SFAeTycdB3oALWynvJAsMZbnk44H1NdFZ+GI1Aa6feT1QZAH4g1tWdpFZwLFEoGAASByT6mrFWopGiiitDYWtuB5UEakd9oz+dWaKKZQUUUUDCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBCAwIIBHoRmqVzpFlcgh4EBPdRg/pV6iiwmjlrzwu6gtbSBu4QjH65rCntpraQpNGyHPcEA/SvRqrXdjBexNHKikkEBscg+ualxXQlxR55RVm/tHsrt4WzgHg46jtVapMwooooAKKKKADBJAAyTXaaBpwtLQTOo82QA5PYY4/nXP6FYfbb0MwzHGQW+vOP1FdxwMAdB0qorqaRXUKKKKosKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDH8QacLqzMyD95GCcjuMc/yriyCDg9a9MIBBBGQRgiuF1qxNlfMAP3bnK/pn9TUyXUzkupm0UUVJAUoBJAHU0lX9HtPtmoIhHyjJb8jj9aFqNK7Or0WyFnp6Aj53AZvYkDitKk6DilrRaGq0QUUUUDCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKyfEFkLnT2cD54ssD7AEn+la1NdQ6lWGQRgj2oeomtDzWirN/bG0vZIT/Cf5jP9arVmYhXV+FrbZBJcEYLHaPoMH+tcqBkgeteg6fbi2sIYsYIUZ+uKcVqXFalqiiirNAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA5XxTa7ZY7lRw3DfXt+grna7vWrYXOmSDGSoLAY7gH/GuEqJLUyktS3plv9p1CGIjIJOfyNeg1yPheDfevKRwqnBx3yP8a66qitCorQKKKKZYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAIyhlKkZBGCK86u4DbXUkJ6qf6Zr0auM8SweVqe8DiRQ3T8P6VMiJrQ1vC8OyxeQjlnOPpgVu1Q0aLytKgGMErk/Wr9NFLQKKKKYwooooAKKq3mo2thHvuZljHbJ61yt94/gjJWyt2kI7yYAP0wTRYV7HaUEgDJIAryy78Z6tckhJRCp6hVB/mKxZ766uX3yzOx9c4/lTsLmR7Q11bp96ZB9TULapYofmu4h9WFeLmWQ9XY/iaC7HqxP40WFzHtK6jZP926iP0YVMs8T/dkU/Q14hvYdGYfjSiWQdJGH/AjRYOY9yorxa21W+tCDDcspHrg/zrbtPHOqQY87ZOB/eAH8hRYfMj06iuRsfHtjMQt1E8LHuACo/HOf0rp7W9tr2IS20yyIe4pDvcnooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFQXV7bWURluZljQdzXMX3j2xgJW1ieZh3IAU/jnP6UCvY66g8V5jd+OdUnz5OyAH+6Af5isS51W+uyTNcsxPpgfyp2FzI9laeJPvSKPqahbUbJPvXUQ+rCvFzLIesjH/gRpN7HqzH8aLC5j2hdUsXPy3cR+jCplurd/uzIfoa8RDsOjEfjQJZB0dh+JosHMe5ggjIIIorxKC+urZ98UzqfXOf51tWnjPVrYgPKJlHQMoH8hRYfMep0Vxdj4/gkIW9t2jJ7x4IH1yRXVWeo2t/HvtplkHfB6UrDvctUUUUDCiiigArnvFUGbaOYDJDBT9ME10NZ2uRebpU3HKjIpNaEvVFy3TyrdE9BipaKKZQUUUUAJnjngVyHiHxklk72th88y5DORwpx256/h2p/jLX/sUBsbZsTyAhyB90ED+YNedbJHBcjIJySTVRi27JGc5pLVkl3eT3s7TXEhd2OSTx/KoKnEUQwXl3DuEBz+oxUpNogzEkjH0kwR+lbxw1SXQ55YmlHrcp0YNWjOhGBbwj3AP+NM85x0YgegrZYKb3Zi8dBbIgxRU5lc9WzTOvWrWBfWRm8euiI6Kkop/UV3F9ffYjoqSkxQ8D2YLMO8RlWbO/udPnE1tKUccZAB4/GocCkKis5YGa2ZpHHwe+h6LoHjKK+Zba9AjnPCsB8rcfU89e1daDkZrw0AqQynBByD6V6H4W8TwzWi2t9NtnTCqSCQwwAOeeeD6Vzzw9SO6Oqniac9mdhRTUkSRQyMGBGQQadWB0BRRRQMKKKKACiiigAoopryJGpZ2CgDJJNAhSeM1yWv+Mo7F2trIeZOOGYj5V4+o56dqTxT4nhitGtbGYNO+VcgEBRgg88c8j1rzsgsSzHJJyT61vDD1JbI56mJpw3ZPeX9zqE5muZS7njJAHH4VWpwUUuB6V0RwM3uzllj4LYZRT8UtaLA92ZvMOyI6Kkoo+or+YPr77EdGKkp4lcDAYik8D2Y1j11RBg0VOZXPViR6GnrOgGDbQk+pB/xqHgprY0WOg90VantLyeynWa3kKOpyCOf51KDaOMypIp9I8AfrURiiOSkoUdg4Of0GKxlhqi6G0cVSls7HfeHvGSXrpa34CTMQFcDhjjvz1/DvXX5445FeHbHTDgYAOQQa9F8G6/9tgFjctmeMAISPvAA/wAgKwlFxeqOiE1JaM62iiipNAqK6j822kTGdwxUtFABRRWVrWt2+jW2+QhpT92MHk/pwP8ACqjFydkRKSiry2L9xcwWsZkmlWNQMkmuS1Tx1DHujsI/MYZAkYED8uDXI6prF3qs5e4kO3JwgJ2jnPTNZ9elRwcUrz3PKrY6UnaGxPeXc19dyXMzZkc5JyePYewqCpIYJrhtsMTyN6IpJ/IVtWfg7Xb1VZLF1U95GCkD6Eg12LkgrbHE+eeurMGiu9tfhncPta5vlQd0CZP5g4rZh+HOkJgySXDkdcOAD+GKh14ItYebPKacsbv91Gb6AmvaYfCeiwAAWUT47uin+lXItH0yD/VWFsn+7EB/Ss3iV0NFhX1Z4cLO6PS3mP0Q/wCFPTTb5zhbSc/9syP6V7ssMSDCRqo9gBTs44FS8U+xawi7nhy6JqT9LKX8RipF8Oas3Syf8SB/WvbM0mRSeKkNYSPc8Ubw5qy9bJ/wIP8AWoW0XUk+9Zyj6DNe3kikOKX1qXYf1OPc8MbT71PvWsw/7Zn/AAqM28yfehkH1UivdGwQQRkelQSWdtKMPBG31UGmsX3Qng+zPDSCDggg0V7LceHtJuFIaxgUnukYB/PFYN78P7KVWNpPJE5yQHwwz9BirjioPczlhJrY4aw1e906RWt53VQclNx2n6gGu60PxjBfssF0BDOcAHB2sfbrjt1Ncdq3hzUNIYmaJmhGcSKARj1OCcfjWSCVYMpIIOQR1BqqlGnWXmKnXqUHZ7Ht4OQPQ9KWsLwrqZ1LSF3nMsXysc57nH6Ct3tXjzi4ScWe5CanFSQUUUVBYUhOAfQdaXtWF4q1M6bpDeWcSy/Kp/EZ/Q1cI88lFETmoRcmU9c8YwWDNBa4mnGQTg7VPv0z36GuFv8AV73UZGa4ndlJyE3HaPoCapMSzFiSSTkk9Sa29F8KalrbBoomjtzjMrgAY9QCRn8K9inRp0VfqeHUr1Kzt0MOlAJOACT6CvUrD4b6fAqNdzyTSDBO0hVJ+hBroIPDmj24ATTrYkdGaJSfzxRLERWyFHDSe54ktpcuMrbysPZCf6VKmmXzn5bSc/WMj+le7JbQRACOGNAOyqBUnAGBUPE9kaLCrqzwxdA1V/u2Un4gCpR4Y1kjIsX/AO+h/jXtpNJmpeJl2KWFj3PEW8N6wnWxf8CD/Wom0TUk+9ZSj6DNe5ZpuaX1qXYPqke54Q2nXqHDWk4/7Zk/0phtLkdbeYfVCP6V7zxjmonhhfhokYe4BqvrT7C+prozwZkZPvKy/UYpK9vl0jTZv9ZY27fWIH+lUZ/CmjTgg2iJn+4oH9KaxUeqJeDl0Z49RXpk/gDTHyYZZ0J9WBA/DArIuvh5coC1tdLJ6KVwfzJrRYimzOWGqI4qp7O7msbuO5hbEiHIOTz7H2rRu/C2sWYJksnZR3QhuPoCaypYpYW2yxujejqQf1rT3Jq2jM/fg76o7vS/HUMhWO/j8tjgGRQSPy5Ndbb3MF1GJIZVkUjIINeKVoaZrF3pU4eCQ7cjKEnaec9M1x1cHFq8Nzto46UXaex7DR0rK0XW7fWbYPGQso+9GTyP8R/jWrXmyi4uzPVjJSV4hXlPiq7ludeuFckrExjUZ4wCf8a9WryfxRGY/EFySMbnLfmTXZgUufU48wb9noY1dd4Q8If24Dd3TlbRWwAOrnnIznjHHbvXI1698PAB4Ujx3lfP5ivQrScY6HmUIqUrM27HRNN02NVtrSJSoA3lRuOPU4yavk+lGaQmuBtt6noJJKyAmkJ96TNNJNTcpIUmmkn1oJpCaTZSQEmkJpCajmnSGJpHICqpYn0AGTSbGkMubqG1iLzSKi+56/SsG68X20LEIgcA9S2M/hiuR17xHLqF66xMRCpIUA5BGev6VhtMznLMT9TQK56TaeMbC4kCSHySehJJGfrgVurKsqhkYMp6EHINeL767Dwdrj/aPsE8hZWH7sk5IORx+ppNDT6M7rNGaSjNSXYXNFJRRcLFe+giubGaGVQyMhBBGe3WvFrtFivZ41GFWRlH0BIFe2XLBLSZieiMf0NeKXp3X1ww7ysf1Nd2Eb1ODGpaHa/D0n7PfDPG5Mfka7SvMPD/AIjXQre4UW/mtKQfvYxjPsfWtB/H1wfuWir/AMDB/pWFfDVJ1HJG+HxVOFJRk9T0CivNn8c6mfubV/AH+lCeOdTH39rfgB/Ss/qVQ1+v0j0muK+IRP2exGeNz5/IVUTx9cj79orf8DA/pWf4g8RrrttbqbfyWiJP3s5zj2HpWlDDVIVFJmWIxVOdJxizGsIlm1G2icZV5VUj1BIBr3myt4rSyhghULGiAAAY6CvB9OYJqdox6CZD/wCPCveoGD2sTDkFAfzArpxLehy4VKzJc0maM00muW52JBmm5oJNITSuNIRmCgsxAA6knAFZV1r1tCxVP3hHcHA/lVHX9TYS/ZomIAHzEHv6fyrnHl680CbOpj8SwswEsZQE9c5x+lasFzDcxiSF1dfY9PrXnUkwAJJAA9TUmm+IV069QeZmNmAYA8AZ6/rUsaZ6KTTSQO9RJOJokkQ5RlDA+oIyKXOals0UR249qTPvSZopXHYXNGaTNFFwsB5GD0qhe6Lp+oIyz2sZLAjeFAYfQ4zV+impNapicU9Gjy3xP4XOjEXEDF7ZjjBHKnjAznnv+Vc1XqXjoA+G3J6iRcfnXltenh5ucLs8nEwUJ2Rt+FbuW2163VCQsrCNhnjBI/wr1avJ/C8Zk8QWxAztcN+RFesVw45LnPRy9v2Ydq828dQeVrSOBw8QJPvk16TXG+PrXdaQXKjJViGPt2/U1lhJctVeZrjI81J+RwFerfDi5V9BeAHLRyEkZ6ZJ/wAK8prt/hverDqc9qTgzqCB/uhif516lZXgeRh3aa8z1DNNzQfammvPbPTSDNITRmo2cKOTz6VLZSVxxPFMaQD3NQu5bjoKbUOXYtQ7j2csfQVieKbk23h65cEgkBc59SB/WtisPxdC0/hq5VRkjDfgCD/SkndlNWWh5Zvo3+9V99G+ruZFjf71Ysro217FMpIKsCMVn76mtENxdxwqMlmAFFwPcEIKg+oFO4pqDCKPQClrM1sLxRxSUUBYpavKIdGvXJwRA+PrtOK8YZi7Fj1JJNeqeMrn7P4enUHDSYUD2JAP6GvKq9HBq0b9zzMc7zSCirMGnXtzjybWWTPTapNaMXhXV5QCbVk9nUj+ldMqkVuzljSm9kYtFdEngrVn7RL9SR/Sh/BWrJ0ETfQk/wBKj29P+Yv6vV/lOdoral8K6vECRas/sik/0rOn069ts+dayx467lIq41IvZkSpTW6ZXRykiuOqkEfUV7vo0vnaHYyE8tbxk/XaM14PXsXgi7Nz4ZtgxG6MFSPQAkD9BWGJXu3N8I/eaOjzTc0GkzXC2egkBNNY4Un2oNRSuApA5ODSbKSuefXt2HmkldgATkkmsW51iNSViG4+ueKytSnn+2yRyscoxGOmKpb6dybF+W9lmOWc47AcVBv561X30b6Vxnr/AIWuDc+HraRiSQCuc+hI/pWzxWF4RhaDw1bKwwTlvwJJ/rW5WbepqloLRx60lFAWFopKKAsLRx60lFAWOR8fzhNKigzzI+QPXBH+NecV13j67EuqRWwOTCpJH1AP9K5GvWw0bU0ePipc1RnUeBYPN1p3I4SIkHHfIr0ntXG+AbXbaT3LDBZgFPt3/UV2Vebi5c1X0PVwceWkgrL1+x+36LPABliAR7YIP9K1KRhlSD0IxXPCTi0zonFSi0zw88HFafh69NhrtpOP+egU/QnB/Q0viCxNhrVxERhWYsg/2STj+VZgJBBBwQcg17yanC/dHzrThOz6M+gFcOispyGAIPqDQTWJ4V1AX/h61fPzRoI2B6/Lxn9K05ZCcgHgdTXlVPdbTPYp++k0Okl6hfzqAnJyaKKx5mzdRSCl/Cko5pXHYKZcRLcW8kLj5ZFKn6EYp/NFFwseK+INLl0fVJIXUiMsTGexGeP0xWV5nvXuGqaTaavbeRdJuAzgjqD6iuJu/hrMZSbS7jCEkgSE5A/AVakupm4PocL5nvXZ+A9Ge5vxqEqEQxDKE92yP6ZrS0z4dQwyh7+cSgdEjPBOe+RXbQQR28SxQqERRgAdBQ5dhxg73ZJxS/hSc0VFy7C8UZpKZLKIYXlY4VFLH6AZo3FscF4/vg91b2in/Vgsw9c4x/KuX0qA3OrWsOMhpVB+mRmn6zeG+1a5nJyDIQp9gTj9K2vA1kZ9Xa4IysK8/U5x/KvWX7qieP8Axq56LHGscaKAAFAHT0FPoorxtz3UrBRRRSGFMkjWSN1IBDAjp6in0U72E1c8a1WA22rXUOMBZWA+mTiuw+HF+EuLmyZslwGQemMk/wAxWZ44sjBq63AHyTLx9RjP86yNBvjp2tW04OFEgDH/AGSRn9K9pP2tFM8Fr2Vdpnt5NNZgBk8UxJllhSVTlWUMD7EZFQu5ZuvFebJ2PVirjnkJ4HAqOiism7miVjzPx5oz21+dQiQmGUZcjs2T/TFcZ5nvXvc8EdzE0UqBkYYIPQ1xGp/DqGaUvYTiIHqkh4Bz2wKpS7kyg73R535nvWr4f0uXWNUjhRSYwwMh7AZ5/TNdLafDWUSg3d3GUBBIjJyR+IrttL0i00i28i0TaDjJPUn1NNyXQSg3uXIIlt7eKFPuxqFH0AxT6KKi5pYX8KPwpKKLhYX8KOKSii4WF4pjuscbO3AUEk+wFOrF8UX4sdBuTnDyKUUeueD/ADqoLmkkiZtRi5HmmtXRvdZupic5kIB9gcD9BVAcnFGSSSTknrWp4esTf61bxAZVWDOP9kEZ/nXtO0IX7I8FXqT06s9K0Cy+waLBARhgCT75JP8AWtOkCgKAOgGKWvBlJybZ9FCPLFIKKKKks4zx3pxlto75BzHw59iQB+pNcDXtV5bJd2ksDgEOpGCM89v1rx2+tHsb6a2cHMblQT3AJANergqvNHle542PpWlzrY1NA8RS6JHcouWEi/KCTgMAcfqaYvivVhdGb7U5BOfLLHb9MZ6VjdRWjpPh+81eQ+RtEYIDMWGRk+hIJ71GMpO/OtjTA1brke56po9+NT0qC7Ax5gOR7gkH9RV7NU9MsU03TobRDkRgjOOpJJP6k1b/ABrz7npJC5ozSUfjRcBc0ZpKKLgLmjNJ+NFFwFzRmko/Gi4C5ozSUfjRcAzXPeMdSFlozwqcSTjav0yM/oTW9JIscbSOwVVGST2FeVeJtWOq6qzKSYY8qgycEAnn8eK6cLTc53eyOXF1VCnZbsxa9P8AB1h9k0VJGGJJuT9MnH6GvPtIsm1DVLe3CkhnG7jsDk/pmvX4YlggjiUfKihR9AMV0Y6pZciObL6d25skooorzD1gooooAKKKKAOd8Y2H2vRXkUZkh5H0yM/oK8wr22aJZ4JImHyupU/QjFeQavZNp+qXFuQQFc7eOoJyP0xXp4GpdcjPJzCnZqaPRPB+q/b9GSF2zLbgKw56ZOP0AroM15P4Z1Y6VqqsxIhkwrjJwASOfw5r1WORZI1kRgysMgjuKwxVNwnfozowlVTp26okzRmkorludYuaM0n40UXAXNGaSj8aLgLmjNJRRcBc0ZpPxoouAuaM0n40fjRcAzXm3jfU/tepLaocxwZBx3Jxkfhiux8RaxHpOmyNuHnupEa55ycDP4Zz+FeUSytNK8rnLuxZj6knJrvwdJ353sedjq1lyIZXfeBNOMVtJfOOZOEPsCQf1AribG0e+vobZAcyOFJHYEgE17DZ2yWlpFAgACKBgDHPf9a0xtXljyrcywFK8+d7FiiiivKPZCiiigArkfGHh/7XEdQtl/fRqS4A+8Bjn8BmuuppUMpVgCCMEEZBFaU6jpyUkZVaaqR5WeIEEE5BBHBBq3p2o3OmXIntpCrDGRk4Iz0I712WueC/tEz3OnlVLEkxEYGfY59c9q5W48P6rbsQ1lM2DjKISP0FevCtTqR3PEnQq0pXsdDb/ECZAPPsw57kPj+laEXj2zfHmQMn4k/0rgnsrqP/AFltMv1jI/pUJBBwQQfQipeGoyLWLrx0PTo/GujMPmmdT6eWx/pUw8X6Kel0fxQj+leVUVH1Kn3LWYVFuj1keKtIPS7H4ginjxJpJ6XificV5HRS+ow7jWYT6o9cPiTSh1vE/A5ph8U6QOt2v4AmvJqKPqMO4f2hPserN4u0Zet0fwQn+lRP400ZR8s7sfTy2/wry6imsFT7iePqdEeiy+PLFf8AVxM/4kf0qnN8QuCIrHnsTJ/TFcOFLHCgk+gGanSyu5PuW0zfSMn+lWsLRiQ8XXka2qeK7/U4DASIoj1CHBPsSKwRycCtGLQtUmIC2M4z3aMgfyrf0fwTdG4jmviqRqwYoOS2OcHpiqc6VKOhKp1q0ldGr4L0YWlp9umTEsoBXI5AweR9Qa6ymIixxrGihUUAADoAOgp9eRVm6knJntUqapw5UFGaK5zW4r+C4Nxbyy+W2MhScLgeg+lZPTU1Su7HR0Vwq6zfr0uGP15pG1i/brcMPocUudF8jO7zRXOaJFfzzi5uJpfLXOFZjhsj0P1ro6a11Ias7BXJ+NNGF3afboUzLECWwOSMDk/QCusproskbRuoZGBBBHBB6itaU3TkpIyq01Uhys8QPBwa3tL8V3+mQCAESxA8Bzkj2BNaWseCboXMk1iVeNmLBDwVzzgdc1gS6FqcJIaxnOO6oSP5V66nSqx1Z4rp1qMtEdRD8QuAJbHnuRJ/TFXY/Hli2PMiZPxJ/pXAvZXcf37aZfrGR/SoCpU4YEH0IxUPC0WUsXXjueoJ400Zh807KfTy2/wqVfF2jN0uj+KEf0rymip+pU+5ax9Tqj1keKdIPS7X8QRTx4k0k9LxPxOK8jopfUYdx/2hPseuHxJpI63ifgc0w+KtIHW7H4AmvJqKPqMO4f2hPseqt4v0Vet0fwQn+lQyeNdGUfLM7H08th/SvMKKawVPqxPH1OiPRJfHtmn+rgZ/+BEf0rPuPiBM4PkWYQ9iXz/SuMAJOACT6AVMlldSf6u2mb6Rk/0q1hqMSHi68tESahqNzqdyZ7mQsxzgZOAM9AO1VMEkYBJPAArTt/D+q3DALZTLk4y6ED9RXVaH4L+zzJc6gVYqQREBkZ9znnnHaqnWp047kQoVasr2JvB/h/7JENQuV/fSKCgI+6Dnn8RiuupAoVQqgAAYAHAApa8ipUdSXMz26VNU48qCiiiszUKKbG4ljVx0IyKdQJO4UUUUDCggEYPNFFAiJ7eB/vwxt9VBqB9K0+T71lb/AFEYB/lVyiqUmtmJwi90ZUnhvSJPvWaD6ZH8qrv4O0Rzk2mD7SMP61u0VSqzW0iHRpv7Jzx8F6Keluw/7aN/jTD4I0g9I2H/AAJv8a6Sin7ep3J+r0v5TnB4J0gdYmP/AANv8acvgzRB1tmP/bVh/Wuhop+3qdx/V6X8piJ4R0ROln+cjH+ZqdPDukxn5bKL8Rn+dadLUurN/aGqNNfZKiaXp8f3bK3Hv5Qz/Kpkt4E+7DGv0UCpaKlyb3ZailsgAA4AxRRRUjCiiigYUjKrgqwBB6gjINLRQBnTaHYTtuMAB/2SQPyBoh0SwgORACfViT+hNaNFKyC77iKqoAqgADoAMAUtFFMAooooAKCAeCM0UUCInt4H+9DG31UGoX0vT5PvWVuffyhn+VW6KpSa2YnFPdGW/h3SZD81lF+Ax/KoH8I6I/Wzx9JGH8jW3SfhVKrNfaI9jTf2Uc+3gvRT0tmH/bRj/Wmt4J0g9ImH/A2/xro6Kft6ncX1el/Kc2PBGkDrGx/4E3+NPHgvRR1t2P8A20b/ABroaKPb1O4vq9L+Uwl8HaIhyLTJ95GP9asR+G9Ij+7Zofrk/wA61aKTqzf2ilRpr7JTTStPj+7ZW49zGCf5VOlvAn3IY1+igVLRUuTe7LUUtkAAAwOKKKKkYUUUUDCiiq95N5FpJJnkDj60EtpK5T0S48208sn5kOAPbj/GtSuS0y6+yXYYnCsMN9K6zIxkUou6OfC1OaFnuhaKKKZ1BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFMlfy4nf+6CfyFAGDrWuvbTG3tiAw+8xGccDGPzrn5NSvJSS87En2A/kKguHMlxI5OSWJ/Wo6zbZi27khuJicmRs/WpUv7pPuzMPwBqtRRcLmjFrmoRHInJHoVH+Fb2j6619KYLgKsh+6QOvHP8q5CpbaVorqN1OCGH86E2NN3PR6KZG/mRK/8AeAP5in1oaBRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA96w9eucBIFPX5j+oxWzJIsUbO3RRk1x1zO1zcNK3VjUydkceLq8sOVbsirptHvftEHlMfnQAfUetczUttcPbTLKhwR29alOzOGhVdOV+h2lFRW1wlzAsiEEEDI9D6VLWh7CaaugooooKCiiigAooooAKKKKACiiigAooooAKKKiuZTBbvKqFyoB2g4J5oAlorMh12ylO1pNjehB4/Sr6TwyAFJUOfQii6CzJKa6B42RhkMCD9DTuvSigDGPhmxLFi0pyc4yP8ACnDw5YD+Fz9SP8K16KVkTZGWNA08f8ss/WlOg6eR/qAPpWnRTsh2Rkt4dsD0Rh9CP8KYPDViGDAycHOMjH8q2aKVkFkNRAiBVGAAAB7U6ijp1pjCio3nhjyWlQY9SKoTa7ZRHar729ADz+OKLoLM06KitpTPbpKyFCwJ2k5I5qWgQUUUUDCiiigAooooAKKKKACiiigAooooAKKKp6jerZwEjHmNkKPfHWhuxEpKKuzN1u+yRbRngcsR9On61iUrMXYsxJJOSTSVk3dnjVantJcwUUUUGZf02/azl2tzGx5GenvXUI6yIHQgqRkEVxFaml6mbdhDKSYycAk9KqL6M7cNiOV8sjpaKRWDqGUggjII70tWekFFFFAwooooAKKKKACiiigAooooAKOowaKKAMbUdBiuiZIj5ch7ADB/lXOTWd9p7nKyKB/EhOPzFd5TJI0lUq6qwPUEZFS4plKbWjOGj1W9ix/pDkDszE/1q1H4jvk4PlsPcHP863rnQbKckhNjHoV4H5Csybws4yYZwR2BXH65qbSWxXNF7kS+KLkdYkP0qRfFMo626n6Nj+lU5PD1+mcIrD2NQNpF8OsDH6AmleQ7RZrDxWR1tPyk/wDrUHxWT0tMfV8/0rFbTb0f8u0p+iH/AAoXTb0/8u0o+qH/AAo5pByxNc+KZT0t1H1bP9KjPii5PSJB9aoDSL49IHH1BFTx+H798ZRVHuaLyC0UPfxJevkARqPYHP8AOqkmq3suc3DrnsrEf1rVh8LOSDNOAO4C5/XNadtoNlAQSm9u5bkH8DTtJ7i5orY5eGzvtQcALI4PO5ycfma6PTtBitSJJcSSehAwP51rRxpEoVFVQOgAwKfVKKRLnfRB0GBRRRVEhRRRQAUUUUAFFFFABRRRQAUUUUAFFFRzTpbxNI5AAGeT1oE2krsbc3KW0LSOQABwM9T6Vyd3dPdzGRzxngZ4AqW/v3vZTyRGD8oz+tU6zk7nlYmvzuy2CiiikcoUUUUAFFFFAGppuqtbkRTEtHwAc8iuijkWVA6MCpGQQa4mrtlqMtm2Mloz1Un+VUpdGdmHxTj7sjrKKr2t5Fdxho257g9RVirPSUlJXQUUUUFBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUVRvdSitFIzuk7KCOPrQ3YiUlFXZYubmO1iLyMAAOBnk/SuYvtQkvZDyVjB4XP86iuruW7kLSMSOw7AVBUOR5lfEuei2CiiipOUKKKKACiiigAooooAKKKKAJIpXgkDxsVIPBrdstbjkAS4G1/73Y1z1FNNo1p1pU3o9DuAwYAqQQehFLXIWmoz2ZwjAp3Ujity21q3mAWQlH9xwf51akj0aeKhPR7mnRSKwYAggg0tM6QooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFNeRIlLOwAHUmgTaW4v1pssqQoXdgqjqTWVda7EmVgBdvUjj/ABrFuLua5bdK+fQdhUuSRy1cXCOkdWad7re4GO2BA7uQP0rGZixJYkk9SaSiobbPOqVZVHqFFFFBmFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFi3vZ7Yjy3IGckHoa17bXkYAXCkH1UcfzzWBRTTaNadecNnodnDdw3C7opAR+I/nUua4hWKkFSQR3Bq5Bqt1BjEhcDs5JH86fN3OyGNT0kjrKOlY0OtkgebFyf7vFW49VtXwN5B9CD/hWEcbh2+VS1PRVObV7F6iokuInGVkU/jUgI9R+FdClGSuncmzW4tFFFUAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUhYDqR+JqN7mKP70ij8c1Mpxirt2Cz6EvWiqEmrWyfdYsfQAj+lUp9bfaTDGB/vc/yrmeOw8ZKPNqU6c1HmsbZI9hVee+t7YfvJAD2ABOfyrmZtRup87pWAPUAkCqpJJJJyTXRzdjzZ43pFG3c68eVt1wOmWH8sGsma5luG3SuWPbPaoqKlts451pz3YUUUUGYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOQZb2FNqWMYXPc1xY+t7Ki3fVnZgKHtayXRElFFFfKH1YoJByCQfUVKt3OnSV8em44qGirjUnHWLaJcU90XU1W5Tup+oJ/rU661KPvIp+nFZdFdEcdiI7TIdGD6GwuuD+KH8Q3/1qkGtRnqh/OsOitlmuJXW5Lw8Gbw1mA9QR+f8AhThq9sepI/A/4Vz9FWs3xCF9WgdF/a1of4z/AN8n/Cj+1rQfxn/vk/4VztFV/bNfshfVoHQHV7YdCT+B/wAKadZgHRSfz/wrBoqXm+IH9Wgbh1uIdEJ/Go21wfww/m3/ANaseioea4l9bDWHgjTbWpj91FH15qF9UuX/AIlH0BH9apUVhLHYiW8y1SguhK11M/WV8em44qMkk5JJPvSUVzyqSk7ybKSS2QUUUVJRA4w3sabUsgyue4qKvq8BW9rRT6o+Ux9H2VZrowooortOMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAxkgetWQMAD2qCMZYVPXz+b1LzUOx72UU0oOfcKKKK8c9kKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAAjII9qrYwSPSrNQSDDGvYyip77h3PGzeneCn2G0UUV9AeCFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBJEPmJqWoou9S18tmbviGj6jLVbDp9wooorgO8KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACopR8wNS1FN2rvyx2xCRwZkr4dvsR0UUV9SfLBRRRQMKKKKACiiigAooooAKKKKAP/Z
""")!
}
